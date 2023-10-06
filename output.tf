output "resposta" {
  value = "teste"
}

output "created_workflows" {
    
    value =[
        for item in var.workflows_names: item
    ]
}

