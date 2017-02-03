/* Copyright 2017 OpenMarket Ltd
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

-- Cache of remote devices.
CREATE TABLE event_push_summary (
    user_id TEXT NOT NULL,
    room_id TEXT NOT NULL,
    notif_count BIGINT NOT NULL
);

CREATE INDEX event_push_summary_user_rm ON event_push_summary(user_id, room_id);


CREATE TABLE event_push_summary_stream_ordering (
    Lock CHAR(1) NOT NULL DEFAULT 'X' UNIQUE,  -- Makes sure this table only has one row.
    stream_ordering BIGINT NOT NULL,
    CHECK (Lock='X')
);

INSERT INTO event_push_summary_stream_ordering (stream_ordering) VALUES (0);