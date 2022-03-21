'''
Author: your Name
Date: 2022-03-16 10:49:50
LastEditors: your Name
LastEditTime: 2022-03-20 20:05:11
Description: 
'''

import os
import blifparser_new.blifparser as blifparser
import blifparser_new.keywords as keywords


def replace_latch_nonvolatile(source, nonvolatile):
    for latch in source.latches:
       
        nonvolatile_params = nonvolatile.model.name + " "
       
        # replace clk
        nonvolatile_params += nonvolatile.inputs.inputs[0] + "=" + latch.control + " "
       
        # replace reset
        reset_sig = '1'
        for elem in source.inputs.inputs:
            if 'rst' in elem or 'reset' in elem:
                reset_sig = elem
        nonvolatile_params += nonvolatile.inputs.inputs[1] + "=" + reset_sig + " "
       
        # replace input
        nonvolatile_params += nonvolatile.inputs.inputs[2] + "=" + latch.input + " "
       
        # replace read_mtj
        read_sig = '0'
        for elem in source.inputs.inputs:
            if 'read_mtj' in elem:
                read_sig = elem
        nonvolatile_params += nonvolatile.inputs.inputs[3] + "=" + read_sig + " "
       
        # replace write_mtj
        write_sig ='0'
        for elem in source.inputs.inputs:
            if 'write_mtj' in elem:
                write_sig = elem
        nonvolatile_params += nonvolatile.inputs.inputs[4] + "=" + write_sig + " "
        # replace output
        nonvolatile_params += nonvolatile.outputs.outputs[0] + "=" + latch.output 
        
        source.subcircuits.append(keywords.subfiles.Subckt(nonvolatile_params))
    
    source.latches.clear()
    
def add_submodel(source, added_source):
    new_submodel = keywords.subfiles.Submodel()
    # Add model attribute into the submodel
    if added_source.model != None:
        new_submodel.model = added_source.model
    # Add inputs attribute into the submodel
    if added_source.inputs != None:
        new_submodel.inputs = added_source.inputs
    # Add outputs attribute into the submodel
    if added_source.outputs != None:
        new_submodel.outputs = added_source.outputs
    new_submodel.blackbox = '.blackbox'
    source.submodel.append(new_submodel)
    


if __name__ == "__main__":
    filepath1 = os.path.abspath("blif/Nonvolatile_FF.abc.blif")
    filepath2 = os.path.abspath("blif/blink.abc.1.blif")
    filepath3 = os.path.abspath("blif/0_stereovision0.abc.blif")
    source_file = blifparser.BlifParser(filepath2)
    nonvolatile = blifparser.BlifParser(filepath1)
    stereo = blifparser.BlifParser(filepath3)
    blif1 = source_file.blif
    blif2 = nonvolatile.blif
    blif3 = stereo.blif
   
        
    

    replace_latch_nonvolatile(blif1,blif2)
    add_submodel(blif1,blif2)
    
    print(blif1)
    print(blif1.inputs.inputs)
    print(blif1)
    with open('blif/output.blif','wt') as f1:
        print(blif1,file=f1)
        
    with open('blif/stereo.test.blif','wt')as f2:
        print(blif3,file=f2)
    
