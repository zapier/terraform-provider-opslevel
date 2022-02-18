package opslevel

import "testing"

func Test_getServiceSlug(t *testing.T) {
	type args struct {
		svc *Service
	}
	tests := []struct {
		name string
		args args
		want string
	}{
		{
			name: "https-url",
			args: args{
				svc: &Service{
					HtmlURL: "https://app.opslevel.com/services/foo",
				},
			},
			want: "foo",
		},
		{
			name: "http-url",
			args: args{
				svc: &Service{
					HtmlURL: "http://app.opslevel.com/services/foo",
				},
			},
			want: "foo",
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			if got := getServiceSlug(tt.args.svc); got != tt.want {
				t.Errorf("getServiceSlug() = %v, want %v", got, tt.want)
			}
		})
	}
}
