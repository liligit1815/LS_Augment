.class final Lo/b$a;
.super Lo/i;
.source "ArraySet.jvm.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lo/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lo/i<",
        "TE;>;"
    }
.end annotation


# instance fields
.field final synthetic j:Lo/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lo/b<",
            "TE;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lo/b;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lo/b$a;->j:Lo/b;

    .line 2
    .line 3
    invoke-virtual {p1}, Lo/b;->n()I

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
            "(I)TE;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lo/b$a;->j:Lo/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lo/b;->s(I)Ljava/lang/Object;

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
    iget-object p0, p0, Lo/b$a;->j:Lo/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lo/b;->o(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method
