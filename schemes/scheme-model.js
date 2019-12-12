const db = require("../data/dbConfig");

module.exports = {
	find,
	findById,
	findSteps,
	add,
	addStep
	// remove
};

function find() {
	return db("schemes");
}

function findById(id) {
	return db("schemes").where({ id });
}

function findSteps(id) {
	return db("schemes")
		.select("schemes.scheme_name", "steps.step_number", "steps.instructions")
		.join("steps", "schemes.id", "steps.scheme_id")
		.where({ scheme_id: id })
		.orderBy("step_number");
}

function add(scheme) {
	return db("schemes")
		.insert(scheme, "id")
		.then(ids => {
			const [id] = ids;

			return findById(id);
		});
}

function addStep(step, id) {
	const newStep = {
        ...step,
        id
    };
    const newStepId = db.insert(newStep, 'step_id').into('steps');
    const addedStep = db('steps').select('*').increment("step_number").where({ id: newStepId });
    return newStepId;
}
