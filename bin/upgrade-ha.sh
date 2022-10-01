#!/bin/bash
lxc exec ha -- docker-compose pull && lxc exec ha -- docker-compose down && lxc exec ha -- docker-compose up -d
