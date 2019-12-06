import React from 'react';
import moment from 'moment';
import { useMutation } from 'react-apollo';
import { Modal, Form, Input, DatePicker, Select } from 'antd';
import locations from '@csnow/utils/locations';
import { MatchRosterFragment } from '@csnow/schema/MatchRosterFragment';
import {
  UpdateTournamentMutation,
  UpdateTournamentMutationVariables,
} from '@csnow/schema/UpdateTournamentMutation';
import updateTournamentMutation from './updateTournamentMutation.gql';

interface IAddMatchModalProms {
  tournamentId: string;
  rosters: MatchRosterFragment[];
  form: any;
  visible: boolean;
  onOk: () => void;
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

  const [updateTournament] = useMutation<
    UpdateTournamentMutation,
    UpdateTournamentMutationVariables
  >(updateTournamentMutation);

  const handleSubmit = (): void => {
    form.validateFields((err, values) => {
      if (!err) {
        // updateTournament({
        //   variables: {
        //     input: {
        //       id: tournament.id,
        //       name: values.name,
        //       location: values.location,
        //       startAt: values.startAt.utc().toISOString(),
        //       endAt: values.endAt.utc().toISOString(),
        //     },
        //   },
        // }).then(() => {
        //   onOk();
        // });
        console.log(values);
      }
    });
    // onOk();
  };

  const compareToFirstRoster = (rule, value, callback) => {
    if (value && value === form.getFieldValue('upperRosterId')) {
      callback("A team can't play itself");
    } else {
      callback();
    }
  };

  return (
    <Modal
      title="Update Tournament"
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
          {getFieldDecorator('startAt', {
            rules: [{ required: true, message: 'Date missing' }],
          })(<DatePicker placeholder="Match start date" />)}
        </Form.Item>
        <Form.Item>
          {getFieldDecorator('endAt', {
            rules: [{ required: true, message: 'Date missing' }],
          })(<DatePicker placeholder="Match end date" />)}
        </Form.Item>
      </Form>
    </Modal>
  );
};

export default Form.create<IAddMatchModalProms>({
  name: 'add_match_form',
})(AddMatchModal);
