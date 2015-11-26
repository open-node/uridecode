# Description

* 解决 decodeURIComponent 遇到特殊字符抛出异常的问题

```js
  decodeURIComponent('%C4%E3%BA%C3'); // 这行代码会抛出异常，因为传入的字符串并非utf编码的 encodeURIComponent 结果

  require('uridecode')('%C4%E3%BA%C3'); // 这行代码会正常返回 '你好' 两个汉字
```
