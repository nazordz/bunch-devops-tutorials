import http from 'k6/http';
import { sleep, group, check } from 'k6';

export const options = {
    scenarios: {
        contacts: {
            executor: 'stepped-arrival-rate',
            preAllocatedVUs: 10,
            timeUnit: '1s',
            startRate: 1,
            stages: [
                { target: 200, duration: '5m' }, // linearly go from 1 iters/s to 200 iters/s for 5 minutes
                { target: 500, duration: '0' }, // instantly jump to 500 iters/s
                { target: 500, duration: '10m' }, // continue with 500 iters/s for 10 minutes
            ],
        },
    },
};

const nginxURL = "http://api.nginx.antonputra.pvt/api/devices"

export default () => {

    group('Send GET requests', () => {
        const res = http.get(nginxURL);
        const checkRes = check(res, {
            'status is 200': (r) => r.status === 200,
        });
    });

    sleep(1);
};
