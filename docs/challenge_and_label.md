# Challenge and Label

This is a detailed description of how to use this protocol in experiments. API documentation can be found [here](https://github.com/dvnstrcklnd/aq-yeast-display/blob/master/operation_types/Challenge_and_Label.md)

## Optional Parameters
Optional parameters can be supplied to Challenge and Label Jobs by adding a Data Association with key `options` to the Plan.
To do this, from the **DESIGNER** page, clisk on **Plan Info**, then on **ADD DATA**. Type `options` as the key, 
and add a JSON object as the value. The JSON object should be formatted like this:
```json
{"assay_microliters": 100, "protease_dilution_factor": 2.0, "quench_protease": false, "pretreatment_item_id":null}
```
Note that keys are in `snake_case` and enclosed in quotes, followed by a colon *outside the closing quote*. Numbers, as well as `true`,
`false`, and `null` are not enclosed in quotes. 

### Default Parameter Values
---
Multiplier to make extra master mix for pipetting error

```json
"make_extra_reagent": 1.1
```
---
The number of ml of an OD = 1.0 culture, 1.0 = 1.2E7 cells

```json
"od_ml_needed": 2.5
```
---
Total volume after protease is added

```json
"assay_microliters": 500
```
---
The amount that the protease or binding target stock is diluted when mixed with the culture

```json
"protease_dilution_factor": 2.0
```
---
How much of each protease sample gets made

```json
"protease_working_microliters": 1000
```
---
How long the protease incubation is allowed to proceed

```json
"protease_incubation_time_minutes": 5
```
---
How often the protease incubation is vortexed

```json
"vortex_interval_minutes": 2
```
---
The volume used to quench the protease reaction

```json
"quench_milliliters": 1.0
```
---
The volume used in each protease or antibody wash

```json
"wash_milliliters": 1.0
```
---
The number of times to wash after protease treatment

```json
"n_protease_washes": 4
```
---
The amount that the antibody gets diluted by

```json
"antibody_dilution_factor": 100.0
```
---
The number of times to wash after antibody treatment

```json
"n_antibody_washes": 2
```
---
The volume of diluted antibody, scales with # of cells

```json
"antibody_microliters_per_od_ml": 200
```
---
Skips incubation but NOT washes if false

```json
"incubate_with_protease": true
```
---
Skips quench step but NOT washes if true

```json
"quench_protease": true
```
---
Skips incubation AND washes if false

```json
"incubate_with_antibody": true
```
---
Adds a pretreatment to the yeast culture if present

```json
"pretreatment_item_id": null
```
---
How long the pretreament incubation lasts 

```json
"pretreatment_incubation_time_minutes": null
```
---
The amount that the pretreatment stock gets diluted by

```json
"pretreatment_dilution_factor": null
```
