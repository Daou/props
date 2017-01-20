import React, { PropTypes } from 'react';
import moment from 'moment';
import cx from 'classnames';
import Vote from '../props/vote';
import styles from './style.css';

import UserComponent from '../../containers/UsersList/User';

const Prop = ({ prop }) => {
  const createdAt = moment(prop.createdAt || prop.created_at).fromNow();
  const receivers = prop.users.map(receiver =>
    <UserComponent userId={receiver} key={receiver} />
  );

  return (
    <li
      className={cx(
        'row',
        'list-group-item',
        styles.prop,
      )}
    >
      <div className="col-xs-12 prop-users">
        <UserComponent userId={prop.propser} />
        <i className="glyphicon glyphicon-chevron-right prop-to" />
        {receivers}
      </div>
      <div className="col-xs-12 prop-content">
        <p className="lead prop-body">
          {prop.body}
        </p>
        <div className="row">
          <div className="col-xs-12 prop-footer">
            <div className="prop-create-at pull-left">
              {createdAt}
            </div>
            <Vote
              onUpvote={() => {}}
              upvotesCount={prop.upvotes_count}
              isUpvotePossible={prop.is_upvote_possible}
              isUndoUpvotePossible={prop.is_undo_upvote_possible}
              undoUpvote={() => {}}
            />
          </div>
        </div>
      </div>
    </li>
  );
};

Prop.propTypes = {
  prop: PropTypes.shape({
    created_at: PropTypes.string.isRequired,
    body: PropTypes.string.isRequired,
    users: PropTypes.array.isRequired,
    propser: PropTypes.number.isRequired,

  }),
};

export default Prop;
