.class final Lo/a$b;
.super Lo/i;
.source "ArrayMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lo/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lo/i<",
        "TK;>;"
    }
.end annotation


# instance fields
.field final synthetic j:Lo/a;


# direct methods
.method constructor <init>(Lo/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lo/a$b;->j:Lo/a;

    .line 2
    .line 3
    invoke-virtual {p1}, Lo/r;->size()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-direct {p0, p1}, Lo/i;-><init>(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method protected b(I)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TK;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lo/a$b;->j:Lo/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lo/r;->f(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method protected c(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lo/a$b;->j:Lo/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lo/r;->h(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method
