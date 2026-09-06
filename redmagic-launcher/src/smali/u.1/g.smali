.class Lu/g;
.super Lu/f;
.source "DimensionDependency.java"


# instance fields
.field public m:I


# direct methods
.method constructor <init>(Lu/p;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lu/f;-><init>(Lu/p;)V

    .line 2
    .line 3
    .line 4
    instance-of p1, p1, Lu/l;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    sget-object p1, Lu/f$a;->h:Lu/f$a;

    .line 9
    .line 10
    iput-object p1, p0, Lu/f;->e:Lu/f$a;

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    sget-object p1, Lu/f$a;->i:Lu/f$a;

    .line 14
    .line 15
    iput-object p1, p0, Lu/f;->e:Lu/f$a;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public d(I)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lu/f;->j:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lu/f;->j:Z

    .line 8
    .line 9
    iput p1, p0, Lu/f;->g:I

    .line 10
    .line 11
    iget-object p0, p0, Lu/f;->k:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lu/d;

    .line 28
    .line 29
    invoke-interface {p1, p1}, Lu/d;->a(Lu/d;)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    :goto_1
    return-void
.end method
