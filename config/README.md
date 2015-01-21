# GET /users/current_tasks.json

- ログインユーザの現在のタスク情報を取得する
- デフォルトではリクエスト日から1週間後まで

### Requirement

```
GET /users/current_tasks.json
```

### Response

```
[
	{
	    id: "1",
		createdAt: "2015-01-21 02:47:20 UTC",
		name: "タスク名1",
		deadline: "2015-01-21",
		yabasa: "3"	,
		memo: "メモ1"
	},
	{
		id: "2",
		createdAt: "2015-01-20 07:04:51 UTC",
		name: "タスク名2",
		deadline: "2015-01-22",
		yabasa: "4"	,
		memo: "メモ2"
	}
]
```

# GET /users/past_tasks.json

- ログインユーザの過去のタスク情報を取得
- リクエスト日以前

### Requirement

```
GET /users/past_tasks.json
```

### Response

```
/users/current_tasks.jsonと同様と同様の形式
```

# GET /users/future_tasks.json

- ログインユーザの先のタスク情報を取得
- デフォルトでは1週間以降

### Requirement

```
GET /users/future_tasks.json
```

### Response

```
/users/current_tasks.jsonと同様の形式
```
