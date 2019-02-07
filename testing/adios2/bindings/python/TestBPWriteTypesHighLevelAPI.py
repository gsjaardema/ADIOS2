#!/usr/bin/env python

#
# Distributed under the OSI-approved Apache License, Version 2.0.  See
# accompanying file Copyright.txt for details.
#
# TestBPWriteTypes.py: test Python numpy types in ADIOS2 File
#                      Write/Read High-Level API
#  Created on: March 12, 2018
#      Author: William F Godoy godoywf@ornl.gov


import sys
from adios2NPTypes import SmallTestData
from mpi4py import MPI
import numpy as np
import adios2

comm = MPI.COMM_WORLD
rank = comm.Get_rank()
size = comm.Get_size()

# Test data
data = SmallTestData()
nx = data.Nx

shape = [size * nx]
start = [rank * nx]
count = [nx]

# Writer
with adios2.open("types_np.bp", "w", comm) as fw:

    for i in range(0, 5):

        data.update(rank, i, size)

        if(rank == 0 and i == 0):
            fw.write("tag", "Testing ADIOS2 high-level API")
            fw.write("gvarI8", np.array(data.I8[0]))
            fw.write("gvarI16", np.array(data.I16[0]))
            fw.write("gvarI32", np.array(data.I32[0]))
            fw.write("gvarI64", np.array(data.I64[0]))
            fw.write("gvarU8", np.array(data.U8[0]))
            fw.write("gvarU16", np.array(data.U16[0]))
            fw.write("gvarU32", np.array(data.U32[0]))
            fw.write("gvarU64", np.array(data.U64[0]))
            fw.write("gvarR32", np.array(data.R32[0]))
            fw.write("gvarR64", np.array(data.R64[0]))

            # single value attributes
            fw.writeattribute("attrStr", "Testing single string attribute")
            fw.writeattribute("attrI8", np.array(data.I8[0]))
            fw.writeattribute("attrI16", np.array(data.I16[0]))
            fw.writeattribute("attrI32", np.array(data.I32[0]))
            fw.writeattribute("attrI64", np.array(data.I64[0]))
            fw.writeattribute("attrU8", np.array(data.U8[0]))
            fw.writeattribute("attrU16", np.array(data.U16[0]))
            fw.writeattribute("attrU32", np.array(data.U32[0]))
            fw.writeattribute("attrU64", np.array(data.U64[0]))
            fw.writeattribute("attrR32", np.array(data.R32[0]))
            fw.writeattribute("attrR64", np.array(data.R64[0]))

            fw.writeattribute(
                "attrStrArray", ["string1", "string2", "string3"])
            fw.writeattribute("attrI8Array",  data.I8)
            fw.writeattribute("attrI16Array", data.I16)
            fw.writeattribute("attrI32Array", data.I32)
            fw.writeattribute("attrI64Array", data.I64)
            fw.writeattribute("attrU8Array",  data.U8)
            fw.writeattribute("attrU16Array", data.U16)
            fw.writeattribute("attrU32Array", data.U32)
            fw.writeattribute("attrU64Array", data.U64)
            fw.writeattribute("attrR32Array", data.R32)
            fw.writeattribute("attrR64Array", data.R64)

        fw.write("steps", "Step:" + str(i))
        fw.write("varI8", data.I8, shape, start, count)
        fw.write("varI16", data.I16, shape, start, count)
        fw.write("varI32", data.I32, shape, start, count)
        fw.write("varI64", data.I64, shape, start, count)
        fw.write("varU8", data.U8, shape, start, count)
        fw.write("varU16", data.U16, shape, start, count)
        fw.write("varU32", data.U32, shape, start, count)
        fw.write("varU64", data.U64, shape, start, count)
        fw.write("varR32", data.R32, shape, start, count)
        fw.write("varR64", data.R64, shape, start, count)

        if(rank == 0 and i == 0):
            fw.writeattribute("varattrStrArray", [
                              "varattr1", "varattr2", "varattr3"], "steps")
            fw.writeattribute("varattrI8Array",  data.I8, "varI8")
            fw.writeattribute("varattrI16Array", data.I16, "varI16")
            fw.writeattribute("varattrI32Array", data.I32, "varI32")
            fw.writeattribute("varattrI64Array", data.I64, "varI64")
            fw.writeattribute("varattrU8Array",  data.U8, "varU8")
            fw.writeattribute("varattrU16Array", data.U16, "varU16")
            fw.writeattribute("varattrU32Array", data.U32, "varU32")
            fw.writeattribute("varattrU64Array", data.U64, "varU64")
            fw.writeattribute("varattrR32Array", data.R32, "varR32")
            fw.writeattribute("varattrR64Array", data.R64, "varR64")

        fw.endl()

comm.Barrier()

# Reader
data = SmallTestData()

with adios2.open("types_np.bp", "r", comm) as fr:

    for fr_step in fr:

        step = fr_step.currentstep()
        data.update(rank, step, size)

        step_vars = fr_step.availablevariables()

#         for name, info in step_vars.items():
#             print("variable_name: " + name)
#             for key, value in info.items():
#                 print("\t" + key + ": " + value)
#             print("\n")

        if(step == 0):
            inTag = fr_step.readstring("tag")
            inI8 = fr_step.read("gvarI8")
            inI16 = fr_step.read("gvarI16")
            inI32 = fr_step.read("gvarI32")
            inI64 = fr_step.read("gvarI64")
            inU8 = fr_step.read("gvarU8")
            inU16 = fr_step.read("gvarU16")
            inU32 = fr_step.read("gvarU32")
            inU64 = fr_step.read("gvarU64")
            inR32 = fr_step.read("gvarR32")
            inR64 = fr_step.read("gvarR64")

            if(inTag[0] != "Testing ADIOS2 high-level API"):
                print("InTag: " + str(inTag))
                raise ValueError('tag variable read failed')

            if(inI8[0] != data.I8[0]):
                raise ValueError('gvarI8 read failed')

            if(inI16[0] != data.I16[0]):
                raise ValueError('gvarI16 read failed')

            if(inI32[0] != data.I32[0]):
                raise ValueError('gvarI32 read failed')

            if(inI64[0] != data.I64[0]):
                raise ValueError('gvarI64 read failed')

            if(inU8[0] != data.U8[0]):
                raise ValueError('gvarU8 read failed')

            if(inU16[0] != data.U16[0]):
                raise ValueError('gvarU16 read failed')

            if(inU32[0] != data.U32[0]):
                raise ValueError('gvarU32 read failed')

            if(inU64[0] != data.U64[0]):
                raise ValueError('gvarU64 read failed')

            if(inR32[0] != data.R32[0]):
                raise ValueError('gvarR32 read failed')

            if(inR64[0] != data.R64[0]):
                raise ValueError('gvarR64 read failed')

            # attributes
            inTag = fr_step.readattributestring("attrStr")
            inI8 = fr_step.readattribute("attrI8")
            inI16 = fr_step.readattribute("attrI16")
            inI32 = fr_step.readattribute("attrI32")
            inI64 = fr_step.readattribute("attrI64")
            inU8 = fr_step.readattribute("attrU8")
            inU16 = fr_step.readattribute("attrU16")
            inU32 = fr_step.readattribute("attrU32")
            inU64 = fr_step.readattribute("attrU64")
            inR32 = fr_step.readattribute("attrR32")
            inR64 = fr_step.readattribute("attrR64")

            if(inTag[0] != "Testing single string attribute"):
                raise ValueError('attr string read failed')

            if(inI8[0] != data.I8[0]):
                raise ValueError('attrI8 read failed')

            if(inI16[0] != data.I16[0]):
                raise ValueError('attrI16 read failed')

            if(inI32[0] != data.I32[0]):
                raise ValueError('attrI32 read failed')

            if(inI64[0] != data.I64[0]):
                raise ValueError('attrI64 read failed')

            if(inU8[0] != data.U8[0]):
                raise ValueError('attrU8 read failed')

            if(inU16[0] != data.U16[0]):
                raise ValueError('attrU16 read failed')

            if(inU32[0] != data.U32[0]):
                raise ValueError('attrU32 read failed')

            if(inU64[0] != data.U64[0]):
                raise ValueError('attrU64 read failed')

            if(inR32[0] != data.R32[0]):
                raise ValueError('attrR32 read failed')

            if(inR64[0] != data.R64[0]):
                raise ValueError('attrR64 read failed')

            # Array attribute
            inTag = fr_step.readattributestring("attrStrArray")
            inI8 = fr_step.readattribute("attrI8Array")
            inI16 = fr_step.readattribute("attrI16Array")
            inI32 = fr_step.readattribute("attrI32Array")
            inI64 = fr_step.readattribute("attrI64Array")
            inU8 = fr_step.readattribute("attrU8Array")
            inU16 = fr_step.readattribute("attrU16Array")
            inU32 = fr_step.readattribute("attrU32Array")
            inU64 = fr_step.readattribute("attrU64Array")
            inR32 = fr_step.readattribute("attrR32Array")
            inR64 = fr_step.readattribute("attrR64Array")

            if(inTag != ["string1", "string2", "string3"]):
                raise ValueError('attrStrArray read failed')

            if((inI8 == data.I8).all() is False):
                raise ValueError('attrI8 array read failed')

            if((inI16 == data.I16).all() is False):
                raise ValueError('attrI16 array read failed')

            if((inI32 == data.I32).all() is False):
                raise ValueError('attrI32 array read failed')

            if((inI64 == data.I64).all() is False):
                raise ValueError('attrI64 array read failed')

            if((inU8 == data.U8).all() is False):
                raise ValueError('attrU8 array read failed')

            if((inU16 == data.U16).all() is False):
                raise ValueError('attrU16 array read failed')

            if((inU32 == data.U32).all() is False):
                raise ValueError('attrU32 array read failed')

            if((inU64 == data.U64).all() is False):
                raise ValueError('attrU64 array read failed')

            if((inR32 == data.R32).all() is False):
                raise ValueError('attrR32 array read failed')

            if((inR64 == data.R64).all() is False):
                raise ValueError('attrR64 array read failed')

            inTags = fr_step.readattributestring("varattrStrArray", "steps")
            inI8 = fr_step.readattribute("varattrI8Array", "varI8")
            in16 = fr_step.readattribute("varattrI16Array", "varI16")
            inI32 = fr_step.readattribute("varattrI32Array", "varI32")
            inI64 = fr_step.readattribute("varattrI64Array", "varI64")
            inU8 = fr_step.readattribute("varattrU8Array",  "varU8")
            inU16 = fr_step.readattribute("varattrU16Array", "varU16")
            inU32 = fr_step.readattribute("varattrU32Array", "varU32")
            inU64 = fr_step.readattribute("varattrU64Array", "varU64")
            inR32 = fr_step.readattribute("varattrR32Array", "varR32")
            inR64 = fr_step.readattribute("varattrR64Array", "varR64")

            if(inTags != ["varattr1", "varattr2", "varattr3"]):
                print(inTags)
                raise ValueError('var attrStrArray read failed')
            
            if((inI8 == data.I8).all() is False):
                raise ValueError('var attrI8 array read failed')

            if((inI16 == data.I16).all() is False):
                raise ValueError('var attrI16 array read failed')

            if((inI32 == data.I32).all() is False):
                raise ValueError('var attrI32 array read failed')

            if((inI64 == data.I64).all() is False):
                raise ValueError('var attrI64 array read failed')

            if((inU8 == data.U8).all() is False):
                raise ValueError('var attrU8 array read failed')

            if((inU16 == data.U16).all() is False):
                raise ValueError('var attrU16 array read failed')

            if((inU32 == data.U32).all() is False):
                raise ValueError('var attrU32 array read failed')

            if((inU64 == data.U64).all() is False):
                raise ValueError('var attrU64 array read failed')

            if((inR32 == data.R32).all() is False):
                raise ValueError('var attrR32 array read failed')

            if((inR64 == data.R64).all() is False):
                raise ValueError('var attrR64 array read failed')

        stepStr = "Step:" + str(step)

        instepStr = fr_step.readstring("steps")
        if(instepStr[0] != stepStr):
            raise ValueError('steps variable read failed: ' +
                             instepStr + " " + stepStr)

        indataI8 = fr_step.read("varI8", start, count)
        indataI16 = fr_step.read("varI16", start, count)
        indataI32 = fr_step.read("varI32", start, count)
        indataI64 = fr_step.read("varI64", start, count)
        indataU8 = fr_step.read("varU8", start, count)
        indataU16 = fr_step.read("varU16", start, count)
        indataU32 = fr_step.read("varU32", start, count)
        indataU64 = fr_step.read("varU64", start, count)
        indataR32 = fr_step.read("varR32", start, count)
        indataR64 = fr_step.read("varR64", start, count)

        if((indataI8 == data.I8).all() is False):
            raise ValueError('I8 array read failed')

        if((indataI16 == data.I16).all() is False):
            raise ValueError('I16 array read failed')

        if((indataI32 == data.I32).all() is False):
            raise ValueError('I32 array read failed')

        if((indataI64 == data.I64).all() is False):
            raise ValueError('I64 array read failed')

        if((indataU8 == data.U8).all() is False):
            raise ValueError('U8 array read failed')

        if((indataU16 == data.U16).all() is False):
            raise ValueError('U16 array read failed')

        if((indataU32 == data.U32).all() is False):
            raise ValueError('U32 array read failed')

        if((indataU64 == data.U64).all() is False):
            raise ValueError('U64 array read failed')

        if((indataR32 == data.R32).all() is False):
            raise ValueError('R32 array read failed')

        if((indataR64 == data.R64).all() is False):
            raise ValueError('R64 array read failed')
