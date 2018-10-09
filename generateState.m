function newState = generateState(state, transMatrix, R)

size(R)


newState = transMatrix*state + noise