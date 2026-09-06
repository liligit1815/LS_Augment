.class final Lh0/f$a;
.super Ljava/lang/Object;
.source "SliceQuery.java"

# interfaces
.implements Lh0/f$f;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lh0/f;->j(Landroidx/slice/SliceItem;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lh0/f$f<",
        "Landroidx/slice/SliceItem;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:[Ljava/lang/String;

.field final synthetic c:[Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lh0/f$a;->a:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Lh0/f$a;->b:[Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lh0/f$a;->c:[Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    check-cast p1, Landroidx/slice/SliceItem;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lh0/f$a;->b(Landroidx/slice/SliceItem;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public b(Landroidx/slice/SliceItem;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lh0/f$a;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, v0}, Lh0/f;->a(Landroidx/slice/SliceItem;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lh0/f$a;->b:[Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p1, v0}, Lh0/f;->q(Landroidx/slice/SliceItem;[Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lh0/f$a;->c:[Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {p1, p0}, Lh0/f;->p(Landroidx/slice/SliceItem;[Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method
