#include <cstdio>
#include <memory.h>
double m[1024][1024];
int main(){
	int nSegs=0;
	scanf("%d",&nSegs);
	double x[1024];
	double y[1024];
	for(int i=0;i<=nSegs;++i){
		scanf("%lf%lf",x+i,y+i);
	}
	double bc_o[2],bc_i[2],bc_v[2];
	for(int i=0;i<2;++i){
		scanf("%lf%lf%lf", bc_o+i, bc_i+i, bc_v+i);
	}
	memset(m,0,sizeof(m));
	double r[1024];
	memset(r,0,sizeof(r));
#define A(I) (I)*4
#define B(I) (I)*4+1
#define C(I) (I)*4+2
#define D(I) (I)*4+3
#define P2(X) (X)*(X)
#define P3(X) P2(X)*(X)
	for(int i=0;i<nSegs;++i){
		m[2*i][A(i)]=1;
		m[2*i][B(i)]=0;
		m[2*i][C(i)]=0;
		m[2*i][D(i)]=0;
		r[2*i]=y[i];
		m[2*i+1][A(i)]=1;
		double dx=x[i+1]-x[i];
		m[2*i+1][B(i)]=dx;
		m[2*i+1][C(i)]=P2(dx);
		m[2*i+1][D(i)]=P3(dx);
		r[2*i+1]=y[i+1];
	}
	int newBase = 2*nSegs;
	for(int i=0;i+1<nSegs;++i){
		double dx=x[i+1]-x[i];
		m[newBase+2*i][B(i)]=1;
		m[newBase+2*i][C(i)]=2*dx;
		m[newBase+2*i][D(i)]=3*P2(dx);
		m[newBase+2*i][B(i+1)]=-1;
		m[newBase+2*i][C(i+1)]=0;
		m[newBase+2*i][D(i+1)]=0;
		r[newBase+2*i]=0;
		m[newBase+2*i+1][C(i)]=2;
		m[newBase+2*i+1][D(i)]=6*dx;
		m[newBase+2*i+1][C(i+1)]=-2;
		m[newBase+2*i+1][D(i+1)]=0;
		r[newBase+2*i+1]=0;
	}
	//double bc_o[2],bc_i[2],bc_v[2];
	for(int i=0;i<2;++i){
		int row = nSegs*4-1-i;
		int j=bc_i[i];
		if(bc_o[i]==1){
			if(0==j){
				m[row][B(0)]=1;
				m[row][C(0)]=0;
				m[row][D(0)]=0;
			}else{
				double dx = x[j]-x[j-1];
				m[row][B(j-1)]=1;
				m[row][C(j-1)]=2*dx;
				m[row][D(j-1)]=3*P2(dx);
			}
		}else if(bc_o[i]==2){
			if(0==j){
				m[row][C(0)]=2;
				m[row][D(0)]=0;
			}else{
				m[row][C(j-1)]=2;
				m[row][D(j-1)]=6*(x[j]-x[j-1]);
			}
		}
		r[row]=bc_v[i];
	}


	freopen("m","w",stdout);
//	printf("%d\n",nSegs*4);fflush(stdout);
	for(int i=0;i<nSegs*4;++i){
		for(int j=0;j<nSegs*4;++j){
			printf("%lf\t",m[i][j]);
		}
		printf("\n");
	}

	freopen("r","w",stdout);
	for(int i=0;i<nSegs*4;++i){
		printf("%lf\n",r[i]);
	}
	return 0;
}

