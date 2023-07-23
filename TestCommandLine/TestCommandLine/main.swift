//
//  main.swift
//  TestCommandLine
//
//  Created by MacBook Pro on 7/23/23.
//

import Foundation

// 原始的获取参数的方式
let list = Swift.CommandLine.arguments
print(list)

// 使用CommandLineKit获取参数的方式
let cli = CommandLine()
let filePathParam = StringOption(shortFlag: "f", longFlag: "file", required: true,
  helpMessage: "Path to the output file.")
let namePrams = StringOption(shortFlag: "n", longFlag: "name",
  helpMessage: "user name.")
let agePrams = IntOption(shortFlag: "a", longFlag: "age",
  helpMessage: "user age.")

cli.addOptions(filePathParam, namePrams, agePrams)
do {
  try cli.parse()
} catch {
  cli.printUsage(error)
  exit(EX_USAGE)
}

print("File path is \(filePathParam.value ?? "")")
print("name is \(namePrams.value ?? "")")
print("age is \(agePrams.value ?? 0)")
