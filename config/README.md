# API document

## version1：開発用テストAPIでありユーザーIDも必要，本番ではサーバーでの認証ユーザーを用いる
## POST /api/v1/tasks
タスク作成を行う．

### Errors
json error: Required paramsがない場合

### Params
| Param name         | Description             |
|:-------------------|:------------------------|
| name(required)     | Value: Must be String   |
| deadline(required) | Value: Must be Date     |
| yabasa(required)   | Value: Must be Interger |
| user_id(required)  | Value: Must be Interger |
| memo(optional)     | Value: Must be String   |

## GET /api/v1/tasks
ユーザーの持つ期間内のタスクを取得．

### Errors
json error: Required paramsがない場合

### Params
| Param name          | Description             |
|:--------------------|:------------------------|
| start_day(required) | Value: Must be Date     |
| end_day(required)   | Value: Must be Date     |
| user_id(required)   | Value: Must be Interger |

### Response
```
[
    {
        id: "1",
        created_at: "2015-01-21 02:47:20 UTC",
        name: "タスク名1",
        deadline: "2015-01-21",
        yabasa: "3" ,
        memo: "メモ1",
        user_id: 1
    },
    {
        id: "2",
        created_at: "2015-01-20 07:04:51 UTC",
        name: "タスク名2",
        deadline: "2015-01-22",
        yabasa: "4" ,
        memo: "メモ2",
        user_id: 1
    }
]
```

## GET /api/v1/tasks/{:id}
特定のタスクを取得．

### Errors
json error: Required paramsがない場合
400 特定のタスクがない場合

### Params
| Param name          | Description             |
|:--------------------|:------------------------|
| start_day(required) | Value: Must be Date     |
| end_day(required)   | Value: Must be Date     |
| user_id(required)   | Value: Must be Interger |

### Response
```
{
    id: "1",
    created_at: "2015-01-21 02:47:20 UTC",
    name: "タスク名1",
    deadline: "2015-01-21",
    yabasa: "3" ,
    memo: "メモ1"
}
```

## PUT /api/v1/tasks
タスクの更新を行う．

### Errors
400 指定のタスクがない場合

### Params
| Param name         | Description             |
|:-------------------|:------------------------|
| id(required)       | Value: Must be Interger |
| name(optional)     | Value: Must be String   |
| deadline(optional) | Value: Must be Date     |
| yabasa(optional)   | Value: Must be Interger |
| user_id(optional)  | Value: Must be Interger |
| memo(optional)     | Value: Must be String   |

## DELETE /api/v1/tasks
タスクの削除を行う．

### Errors
400 指定のタスクがない場合，発生

### Params
| Param name         | Description             |
|:-------------------|:------------------------|
| id(required)       | Value: Must be Interger |
