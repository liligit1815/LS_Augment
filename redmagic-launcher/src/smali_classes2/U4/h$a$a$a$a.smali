.class LU4/h$a$a$a$a;
.super Ljava/lang/Object;
.source "OperatorSubscribeOn.java"

# interfaces
.implements LT4/a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LU4/h$a$a$a;->request(J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:J

.field final synthetic h:LU4/h$a$a$a;


# direct methods
.method constructor <init>(LU4/h$a$a$a;J)V
    .locals 0

    .line 1
    iput-object p1, p0, LU4/h$a$a$a$a;->h:LU4/h$a$a$a;

    .line 2
    .line 3
    iput-wide p2, p0, LU4/h$a$a$a$a;->g:J

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public call()V
    .locals 3

    .line 1
    iget-object v0, p0, LU4/h$a$a$a$a;->h:LU4/h$a$a$a;

    .line 2
    .line 3
    iget-object v0, v0, LU4/h$a$a$a;->g:Lrx/d;

    .line 4
    .line 5
    iget-wide v1, p0, LU4/h$a$a$a$a;->g:J

    .line 6
    .line 7
    invoke-interface {v0, v1, v2}, Lrx/d;->request(J)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
