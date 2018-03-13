function asp {
	local rprompt=${RPROMPT/<aws:$AWS_PROFILE>/}
	if [ -n "$1" ]; then
		export AWS_PROFILE=$1
	else
		unset AWS_PROFILE
	fi
}

function aws_profiles {
	reply=($(sed -n 's/.*profile \([a-zA-Z0-9_-]*\).*/\1/ p' ~/.aws/config))
}

compctl -K aws_profiles asp

function prompt_aws_profile() {
	echo "${AWS_PROFILE:+<aws:$AWS_PROFILE>}"
}

RPROMPT="\$(prompt_aws_profile)${RPROMPT:-}"
