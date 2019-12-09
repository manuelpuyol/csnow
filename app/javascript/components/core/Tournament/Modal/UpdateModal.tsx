import React from 'react';
import moment from 'moment';
import { useMutation } from 'react-apollo';
import { Modal, Form, Input, DatePicker, Select, message } from 'antd';
import locations from '@csnow/utils/locations';
import { TournamentFragment } from '@csnow/schema/TournamentFragment';
import {
  UpdateTournamentMutation,
  UpdateTournamentMutationVariables,
} from '@csnow/schema/UpdateTournamentMutation';
import updateTournamentMutation from './updateTournamentMutation.gql';

interface IUpdateTournamentFormProms {
  tournament: TournamentFragment;
  form: any;
  visible: boolean;
  onOk: (tournament: TournamentFragment) => void;
  onCancel: () => void;
}
const { Option } = Select;
const UpdateTournamentForm: React.FC<IUpdateTournamentFormProms> = ({
  form,
  tournament,
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
        updateTournament({
          variables: {
            input: {
              id: tournament.id,
              name: values.name,
              location: values.location,
              startAt: values.startAt.utc().toISOString(),
              endAt: values.endAt.utc().toISOString(),
            },
          },
        })
          .then(response => {
            const e = response.data.updateTournament.errors;

            if (e) {
              message.error(e.join('\n'));
            } else {
              message.success('Tournament updated successfully!');
              onOk(response.data.updateTournament.tournament);
            }
          })
          .catch(e => {
            message.error('Uh oh, some unexpected error happened', e);
          });
      }
    });
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
          {getFieldDecorator('name', {
            rules: [{ required: true, message: 'Name missing' }],
            initialValue: tournament.name,
          })(<Input placeholder="Tournament name" />)}
        </Form.Item>
        <Form.Item>
          {getFieldDecorator('location', {
            initialValue: tournament.location,
          })(
            <Select allowClear showSearch placeholder="Tournament location">
              {locations.map(loc => (
                <Option value={loc} key={loc}>
                  {loc}
                </Option>
              ))}
            </Select>,
          )}
        </Form.Item>
        <Form.Item>
          {getFieldDecorator('startAt', {
            rules: [{ required: true, message: 'Date missing' }],
            initialValue: moment(tournament.startAt),
          })(<DatePicker placeholder="Tournament start date" />)}
        </Form.Item>
        <Form.Item>
          {getFieldDecorator('endAt', {
            rules: [{ required: true, message: 'Date missing' }],
            initialValue: moment(tournament.endAt),
          })(<DatePicker placeholder="Tournament end date" />)}
        </Form.Item>
      </Form>
    </Modal>
  );
};

export default Form.create<IUpdateTournamentFormProms>({
  name: 'update_tournament_form',
})(UpdateTournamentForm);
