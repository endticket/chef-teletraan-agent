teletraan-agent Cookbook
========================
Configures teletraan agent


Attributes
----------
#### teletraan-agent::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['teletraan']['release_version']</tt></td>
    <td>string</td>
    <td>teletraan version</td>
    <td><tt>v1.0.1</tt></td>
  </tr>
  <tr>
    <td><tt>['teletraan']['agent_version']</tt></td>
    <td>string</td>
    <td>deploy agent version</td>
    <td><tt>v1.2.3</tt></td>
  </tr>
  <tr>
    <td><tt>['teletraan']['proto']</tt></td>
    <td>string</td>
    <td>deploy service protocol</td>
    <td><tt>http</tt></td>
  </tr>
  <tr>
    <td><tt>['teletraan']['host']</tt></td>
    <td>string</td>
    <td>deploy service host</td>
    <td><tt>127.0.0.1</tt></td>
  </tr>
  <tr>
    <td><tt>['teletraan']['port']</tt></td>
    <td>string</td>
    <td>deploy service listen port</td>
    <td><tt>8080</tt></td>
  </tr>
</table>

Usage
-----
#### teletraan-agent::default

Just include `teletraan-agent` in your node's `run_list` and set your teletraan host related attributes:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[teletraan-agent]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: deathowl
