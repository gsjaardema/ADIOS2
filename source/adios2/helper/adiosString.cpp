/*
 * Distributed under the OSI-approved Apache License, Version 2.0.  See
 * accompanying file Copyright.txt for details.
 *
 * adiosString.cpp
 *
 *  Created on: May 17, 2017
 *      Author: William F Godoy godoywf@ornl.gov
 */

#include "adiosString.h"

/// \cond EXCLUDE_FROM_DOXYGEN
#include <fstream>
#include <ios> //std::ios_base::failure
#include <sstream>
#include <stdexcept> // std::invalid_argument
/// \endcond

namespace adios
{

std::string FileToString(const std::string &fileName)
{
    std::ifstream fileStream(fileName);

    if (!fileStream.good())
    {
        throw std::ios_base::failure(
            "ERROR: file " + fileName +
            " could not be opened. Check permissions or existence\n");
    }

    std::ostringstream fileSS;
    fileSS << fileStream.rdbuf();
    fileStream.close();
    return fileSS.str();
}

Params BuildParametersMap(const std::vector<std::string> &parameters,
                          const bool debugMode)
{
    auto lf_GetFieldValue = [](const std::string parameter, std::string &field,
                               std::string &value, const bool debugMode) {
        auto equalPosition = parameter.find("=");

        if (debugMode)
        {
            if (equalPosition == parameter.npos)
            {
                throw std::invalid_argument(
                    "ERROR: wrong format for parameter " + parameter +
                    ", format must be field=value \n");
            }

            if (equalPosition == parameter.size() - 1)
            {
                throw std::invalid_argument("ERROR: empty value in parameter " +
                                            parameter +
                                            ", format must be field=value \n");
            }
        }

        field = parameter.substr(0, equalPosition);
        value = parameter.substr(equalPosition + 1); // need to test
    };

    // BODY OF FUNCTION STARTS HERE
    Params parametersOutput;

    for (const auto parameter : parameters)
    {
        std::string field, value;
        lf_GetFieldValue(parameter, field, value, debugMode);

        if (debugMode)
        {
            if (parametersOutput.count(field) == 1)
            {
                throw std::invalid_argument(
                    "ERROR: parameter " + field +
                    " already exists, must be unique\n");
            }
        }

        parametersOutput[field] = value;
    }

    return parametersOutput;
}

std::string AddExtension(const std::string &name,
                         const std::string extension) noexcept
{
    std::string result(name);
    if (name.find(extension) != name.size() - 3)
    {
        result += extension;
    }
    return result;
}

std::vector<std::string>
GetParametersValues(const std::string &key,
                    const std::vector<Params> &parametersVector) noexcept
{
    std::vector<std::string> values;
    values.reserve(parametersVector.size());

    for (const auto &parameters : parametersVector)
    {
        auto itKey = parameters.find(key);
        std::string value;
        if (itKey != parameters.end())
        {
            value = itKey->second;
        }
        values.push_back(value);
    }

    return values;
}

void SetParameterValue(const std::string key, const Params &parameters,
                       std::string &value) noexcept
{
    auto itKey = parameters.find(key);
    if (itKey != parameters.end())
    {
        value = itKey->second;
    }
}

} // end namespace adios
