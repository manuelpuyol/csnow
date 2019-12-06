import React from 'react';
import moment from 'moment';
import { useMutation } from 'react-apollo';
import { Modal, Form, Input, DatePicker, Select } from 'antd';
import locations from '@csnow/utils/locations';
import { MatchRosterFragment } from '@csnow/schema/MatchRosterFragment';
import {
  CreateMatchMutation,
  CreateMatchMutationVariables,
} from '@csnow/schema/CreateMatchMutation';
import createMatchMutation from './createMatchMutation.gql';

interface IAddMatchModalProms {
  tournamentId: string;
  rosters: MatchRosterFragment[];
  form: any;
  visible: boolean;
  onOk: (match) => void;
  onCancel: () => void;
}
const { Option } = Select;
const AddMatchModal: React.FC<IAddMatchModalProms> = ({
  tournamentId,
  form,
  rosters,
  visible,
  onOk,
  onCancel,
}) => {
  const { getFieldDecorator } = form;

  const [createMatch] = useMutation<
    CreateMatchMutation,
    CreateMatchMutationVariables
  >(createMatchMutation);

  const handleSubmit = (): void => {
    form.validateFields((err, values) => {
      if (!err) {
        createMatch({
          variables: {
            input: {
              tournamentId,
              upperRosterId: values.upperRosterId,
              lowerRosterId: values.lowerRosterId,
              winnerId: values.winnerId,
              startAt: values.startAt.utc().toISOString(),
              endAt: values.endAt && values.endAt.utc().toISOString(),
            },
          },
        }).then(match => {
          onOk(match.data.createMatch.match);
        });
      }
    });
  };

  const compareToFirstRoster = (rule, value, callback) => {
    if (value && value === form.getFieldValue('upperRosterId')) {
      callback("A team can't play itself");
    } else {
      callback();
    }
  };

  const winnerMustBeInMatch = (rule, value, callback) => {
    if (
      value &&
      value !== form.getFieldValue('upperRosterId') &&
      value !== form.getFieldValue('lowerRosterId')
    ) {
      callback('Winner must be in match');
    } else {
      callback();
    }
  };

  return (
    <Modal
      title="Add Match"
      visible={visible}
      onOk={handleSubmit}
      onCancel={onCancel}
      okText="Submit"
    >
      <Form>
        <Form.Item>
          {getFieldDecorator('upperRosterId')(
            <Select allowClear placeholder="Roster 1">
              {rosters.map(roster => (
                <Option value={roster.id} key={roster.id}>
                  {roster.name}
                </Option>
              ))}
            </Select>,
          )}
        </Form.Item>
        <Form.Item>
          {getFieldDecorator('lowerRosterId', {
            rules: [
              {
                validator: compareToFirstRoster,
              },
            ],
          })(
            <Select allowClear placeholder="Roster 2">
              {rosters.map(roster => (
                <Option value={roster.id} key={roster.id}>
                  {roster.name}
                </Option>
              ))}
            </Select>,
          )}
        </Form.Item>
        <Form.Item>
          {getFieldDecorator('winnerId', {
            rules: [
              {
                validator: winnerMustBeInMatch,
              },
            ],
          })(
            <Select allowClear placeholder="Winner">
              {rosters.map(roster => (
                <Option value={roster.id} key={roster.id}>
                  {roster.name}
                </Option>
              ))}
            </Select>,
          )}
        </Form.Item>
        <Form.Item>
          {getFieldDecorator('startAt', {
            rules: [{ required: true, message: 'Date missing' }],
          })(<DatePicker placeholder="Match start date" />)}
        </Form.Item>
        <Form.Item>
          {getFieldDecorator('endAt')(
            <DatePicker placeholder="Match end date" />,
          )}
        </Form.Item>
      </Form>
    </Modal>
  );
};

export default Form.create<IAddMatchModalProms>({
  name: 'add_match_form',
})(AddMatchModal);
