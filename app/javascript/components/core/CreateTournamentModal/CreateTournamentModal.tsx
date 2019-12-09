import React from 'react';
import { useMutation } from 'react-apollo';
import { Modal, Form, Input, DatePicker, Select, message } from 'antd';
import locations from '@csnow/utils/locations';
import {
  CreateTournamentMutation,
  CreateTournamentMutationVariables,
} from '@csnow/schema/CreateTournamentMutation';
import createTournamentMutation from './createTournamentMutation.gql';

interface ICreateTournamentModalProms {
  form: any;
  visible: boolean;
  onOk: (tournament) => void;
  onCancel: () => void;
}
const { Option } = Select;
const CreateTournamentModal: React.FC<ICreateTournamentModalProms> = ({
  form,
  visible,
  onOk,
  onCancel,
}) => {
  const { getFieldDecorator } = form;

  const [createMatch] = useMutation<
    CreateTournamentMutation,
    CreateTournamentMutationVariables
  >(createTournamentMutation);

  const endAtMustBeAfterStartAt = (rule, value, callback) => {
    if (value && value < form.getFieldValue('startAt')) {
      callback('Tournament must end at after it starts');
    } else {
      callback();
    }
  };

  const handleSubmit = (): void => {
    form.validateFields((err, values) => {
      if (!err) {
        createMatch({
          variables: {
            input: {
              name: values.name,
              location: values.location,
              startAt: values.startAt.utc().toISOString(),
              endAt: values.endAt.utc().toISOString(),
            },
          },
        })
          .then(response => {
            const e = response.data.createTournament.errors;
            if (e) {
              message.error(e.join('\n'));
            } else {
              const t = response.data.createTournament.tournament;
              message.success(`Tournament ${t.name} created!`);
              onOk(t);
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
      title="Create Tournament"
      visible={visible}
      onOk={handleSubmit}
      onCancel={onCancel}
      okText="Submit"
    >
      <Form>
        <Form.Item>
          {getFieldDecorator('name', {
            rules: [{ required: true, message: 'Name missing' }],
          })(<Input placeholder="Tournament name" />)}
        </Form.Item>
        <Form.Item>
          {getFieldDecorator('location')(
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
          })(<DatePicker placeholder="Tournament start date" />)}
        </Form.Item>
        <Form.Item>
          {getFieldDecorator('endAt', {
            rules: [
              { required: true, message: 'Date missing' },
              { validator: endAtMustBeAfterStartAt },
            ],
          })(<DatePicker placeholder="Tournament end date" />)}
        </Form.Item>
      </Form>
    </Modal>
  );
};

export default Form.create<ICreateTournamentModalProms>({
  name: 'create_tournament_form',
})(CreateTournamentModal);
