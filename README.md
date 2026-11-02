# ConversaRadar

SaaS beta para organizar conversas comerciais e sinalizar oportunidades de acompanhamento.

## Estado atual
- Landing page informativa.
- Painel beta com cadastro/login e importação CSV/TXT.
- Supabase como backend, com organizações, membros e conversas protegidas por RLS.
- Classificação inicial por regras heurísticas; não é IA generativa.
- Função Edge `analyze-conversations` publicada no projeto Supabase.

## Limitações
Ainda não está pronto para venda. Não possui WhatsApp oficial, IA generativa integrada, cobrança recorrente, domínio próprio, política completa de privacidade/termos nem testes de segurança ponta a ponta.

## Estrutura
- `index.html`: página pública.
- `app/index.html`: painel beta.
- `supabase/schema.sql`: esquema de banco de dados.

## Configuração
Configure no painel beta a URL do projeto Supabase e a chave publishable. Nunca coloque service_role ou secret key no frontend. Configure Authentication > URL Configuration com os domínios de desenvolvimento e produção.

## Privacidade
Use apenas dados que a empresa tenha autorização para tratar. Minimize dados pessoais, defina retenção e ofereça exclusão/exportação antes de uso comercial. Sugestões automáticas exigem revisão humana.

## Próximos marcos
1. Corrigir e validar a configuração de ambiente do frontend.
2. Testar cadastro, login, confirmação de e-mail e isolamento entre duas organizações.
3. Integrar IA generativa no backend com limites e controle de custos.
4. Implementar exclusão de dados, auditoria e limites por plano.
5. Integrar WhatsApp pela API oficial e pagamentos recorrentes.
6. Publicar com domínio, termos, política de privacidade e monitoramento.
