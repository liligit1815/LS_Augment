.class final Lj4/a$c;
.super Ljava/lang/Object;
.source "ListBuilder.kt"

# interfaces
.implements Ljava/util/ListIterator;
.implements Lv4/a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lj4/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/ListIterator<",
        "TE;>;",
        "Lv4/a;"
    }
.end annotation


# instance fields
.field private final g:Lj4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lj4/a<",
            "TE;>;"
        }
    .end annotation
.end field

.field private h:I

.field private i:I

.field private j:I


# direct methods
.method public constructor <init>(Lj4/a;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lj4/a<",
            "TE;>;I)V"
        }
    .end annotation

    .line 1
    const-string v0, "list"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lj4/a$c;->g:Lj4/a;

    .line 10
    .line 11
    iput p2, p0, Lj4/a$c;->h:I

    .line 12
    .line 13
    const/4 p2, -0x1

    .line 14
    iput p2, p0, Lj4/a$c;->i:I

    .line 15
    .line 16
    invoke-static {p1}, Lj4/a;->p(Lj4/a;)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    iput p1, p0, Lj4/a$c;->j:I

    .line 21
    .line 22
    return-void
.end method

.method private final b()V
    .locals 1

    .line 1
    iget-object v0, p0, Lj4/a$c;->g:Lj4/a;

    .line 2
    .line 3
    invoke-static {v0}, Lj4/a;->p(Lj4/a;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget p0, p0, Lj4/a$c;->j:I

    .line 8
    .line 9
    if-ne v0, p0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    new-instance p0, Ljava/util/ConcurrentModificationException;

    .line 13
    .line 14
    invoke-direct {p0}, Ljava/util/ConcurrentModificationException;-><init>()V

    .line 15
    .line 16
    .line 17
    throw p0
.end method


# virtual methods
.method public add(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lj4/a$c;->b()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lj4/a$c;->g:Lj4/a;

    .line 5
    .line 6
    iget v1, p0, Lj4/a$c;->h:I

    .line 7
    .line 8
    add-int/lit8 v2, v1, 0x1

    .line 9
    .line 10
    iput v2, p0, Lj4/a$c;->h:I

    .line 11
    .line 12
    invoke-virtual {v0, v1, p1}, Lj4/a;->add(ILjava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    const/4 p1, -0x1

    .line 16
    iput p1, p0, Lj4/a$c;->i:I

    .line 17
    .line 18
    iget-object p1, p0, Lj4/a$c;->g:Lj4/a;

    .line 19
    .line 20
    invoke-static {p1}, Lj4/a;->p(Lj4/a;)I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    iput p1, p0, Lj4/a$c;->j:I

    .line 25
    .line 26
    return-void
.end method

.method public hasNext()Z
    .locals 1

    .line 1
    iget v0, p0, Lj4/a$c;->h:I

    .line 2
    .line 3
    iget-object p0, p0, Lj4/a$c;->g:Lj4/a;

    .line 4
    .line 5
    invoke-static {p0}, Lj4/a;->o(Lj4/a;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-ge v0, p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public hasPrevious()Z
    .locals 0

    .line 1
    iget p0, p0, Lj4/a$c;->h:I

    .line 2
    .line 3
    if-lez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public next()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lj4/a$c;->b()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lj4/a$c;->h:I

    .line 5
    .line 6
    iget-object v1, p0, Lj4/a$c;->g:Lj4/a;

    .line 7
    .line 8
    invoke-static {v1}, Lj4/a;->o(Lj4/a;)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-ge v0, v1, :cond_0

    .line 13
    .line 14
    iget v0, p0, Lj4/a$c;->h:I

    .line 15
    .line 16
    add-int/lit8 v1, v0, 0x1

    .line 17
    .line 18
    iput v1, p0, Lj4/a$c;->h:I

    .line 19
    .line 20
    iput v0, p0, Lj4/a$c;->i:I

    .line 21
    .line 22
    iget-object v0, p0, Lj4/a$c;->g:Lj4/a;

    .line 23
    .line 24
    invoke-static {v0}, Lj4/a;->n(Lj4/a;)[Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget p0, p0, Lj4/a$c;->i:I

    .line 29
    .line 30
    aget-object p0, v0, p0

    .line 31
    .line 32
    return-object p0

    .line 33
    :cond_0
    new-instance p0, Ljava/util/NoSuchElementException;

    .line 34
    .line 35
    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    .line 36
    .line 37
    .line 38
    throw p0
.end method

.method public nextIndex()I
    .locals 0

    .line 1
    iget p0, p0, Lj4/a$c;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public previous()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lj4/a$c;->b()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lj4/a$c;->h:I

    .line 5
    .line 6
    if-lez v0, :cond_0

    .line 7
    .line 8
    add-int/lit8 v0, v0, -0x1

    .line 9
    .line 10
    iput v0, p0, Lj4/a$c;->h:I

    .line 11
    .line 12
    iput v0, p0, Lj4/a$c;->i:I

    .line 13
    .line 14
    iget-object v0, p0, Lj4/a$c;->g:Lj4/a;

    .line 15
    .line 16
    invoke-static {v0}, Lj4/a;->n(Lj4/a;)[Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget p0, p0, Lj4/a$c;->i:I

    .line 21
    .line 22
    aget-object p0, v0, p0

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_0
    new-instance p0, Ljava/util/NoSuchElementException;

    .line 26
    .line 27
    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    .line 28
    .line 29
    .line 30
    throw p0
.end method

.method public previousIndex()I
    .locals 0

    .line 1
    iget p0, p0, Lj4/a$c;->h:I

    .line 2
    .line 3
    add-int/lit8 p0, p0, -0x1

    .line 4
    .line 5
    return p0
.end method

.method public remove()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lj4/a$c;->b()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lj4/a$c;->i:I

    .line 5
    .line 6
    const/4 v1, -0x1

    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    iget-object v2, p0, Lj4/a$c;->g:Lj4/a;

    .line 10
    .line 11
    invoke-virtual {v2, v0}, Li4/c;->remove(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    iget v0, p0, Lj4/a$c;->i:I

    .line 15
    .line 16
    iput v0, p0, Lj4/a$c;->h:I

    .line 17
    .line 18
    iput v1, p0, Lj4/a$c;->i:I

    .line 19
    .line 20
    iget-object v0, p0, Lj4/a$c;->g:Lj4/a;

    .line 21
    .line 22
    invoke-static {v0}, Lj4/a;->p(Lj4/a;)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iput v0, p0, Lj4/a$c;->j:I

    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 30
    .line 31
    const-string v0, "Call next() or previous() before removing element from the iterator."

    .line 32
    .line 33
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    throw p0
.end method

.method public set(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lj4/a$c;->b()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lj4/a$c;->i:I

    .line 5
    .line 6
    const/4 v1, -0x1

    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lj4/a$c;->g:Lj4/a;

    .line 10
    .line 11
    invoke-virtual {p0, v0, p1}, Lj4/a;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 16
    .line 17
    const-string p1, "Call next() or previous() before replacing element from the iterator."

    .line 18
    .line 19
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    throw p0
.end method
