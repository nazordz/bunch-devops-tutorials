import http from 'k6/http';
import { sleep, group, check } from 'k6';

export const options = {
    scenarios: {
        test: {
            executor: 'ramping-vus',
            startVUs: 1,
            stages: [
                { target: 20, duration: '30s' }, // linearly go from 3 VUs to 20 VUs for 30s
                { target: 100, duration: '0' }, // instantly jump to 100 VUs
                { target: 100, duration: '1m' }, // continue with 100 VUs for 10 minutes
            ],
        },
    },
};

const url = "http://go.antonputra.pvt/api/devices"

export default () => {

    group('Send GET requests', () => {
        const res = http.get(url);
        const checkRes = check(res, {
            'status is 200': (r) => r.status === 200,
        });
    });

    sleep(1);
};
