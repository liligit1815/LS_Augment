.class public final Landroidx/slice/SliceItemParcelizer;
.super Ljava/lang/Object;
.source "SliceItemParcelizer.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static read(Landroidx/versionedparcelable/a;)Landroidx/slice/SliceItem;
    .locals 3

    .line 1
    new-instance v0, Landroidx/slice/SliceItem;

    .line 2
    .line 3
    invoke-direct {v0}, Landroidx/slice/SliceItem;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, v0, Landroidx/slice/SliceItem;->a:[Ljava/lang/String;

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    invoke-virtual {p0, v1, v2}, Landroidx/versionedparcelable/a;->i([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, [Ljava/lang/String;

    .line 14
    .line 15
    iput-object v1, v0, Landroidx/slice/SliceItem;->a:[Ljava/lang/String;

    .line 16
    .line 17
    iget-object v1, v0, Landroidx/slice/SliceItem;->b:Ljava/lang/String;

    .line 18
    .line 19
    const/4 v2, 0x2

    .line 20
    invoke-virtual {p0, v1, v2}, Landroidx/versionedparcelable/a;->z(Ljava/lang/String;I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iput-object v1, v0, Landroidx/slice/SliceItem;->b:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v1, v0, Landroidx/slice/SliceItem;->c:Ljava/lang/String;

    .line 27
    .line 28
    const/4 v2, 0x3

    .line 29
    invoke-virtual {p0, v1, v2}, Landroidx/versionedparcelable/a;->z(Ljava/lang/String;I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iput-object v1, v0, Landroidx/slice/SliceItem;->c:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v1, v0, Landroidx/slice/SliceItem;->f:Landroidx/slice/SliceItemHolder;

    .line 36
    .line 37
    const/4 v2, 0x4

    .line 38
    invoke-virtual {p0, v1, v2}, Landroidx/versionedparcelable/a;->C(Ll0/a;I)Ll0/a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    check-cast p0, Landroidx/slice/SliceItemHolder;

    .line 43
    .line 44
    iput-object p0, v0, Landroidx/slice/SliceItem;->f:Landroidx/slice/SliceItemHolder;

    .line 45
    .line 46
    invoke-virtual {v0}, Landroidx/slice/SliceItem;->t()V

    .line 47
    .line 48
    .line 49
    return-object v0
.end method

.method public static write(Landroidx/slice/SliceItem;Landroidx/versionedparcelable/a;)V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p1, v0, v0}, Landroidx/versionedparcelable/a;->E(ZZ)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p1}, Landroidx/versionedparcelable/a;->g()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0, v1}, Landroidx/slice/SliceItem;->u(Z)V

    .line 10
    .line 11
    .line 12
    sget-object v1, Landroidx/slice/Slice;->e:[Ljava/lang/String;

    .line 13
    .line 14
    iget-object v2, p0, Landroidx/slice/SliceItem;->a:[Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {v1, v2}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-nez v1, :cond_0

    .line 21
    .line 22
    iget-object v1, p0, Landroidx/slice/SliceItem;->a:[Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p1, v1, v0}, Landroidx/versionedparcelable/a;->G([Ljava/lang/Object;I)V

    .line 25
    .line 26
    .line 27
    :cond_0
    const-string v0, "text"

    .line 28
    .line 29
    iget-object v1, p0, Landroidx/slice/SliceItem;->b:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    iget-object v0, p0, Landroidx/slice/SliceItem;->b:Ljava/lang/String;

    .line 38
    .line 39
    const/4 v1, 0x2

    .line 40
    invoke-virtual {p1, v0, v1}, Landroidx/versionedparcelable/a;->V(Ljava/lang/String;I)V

    .line 41
    .line 42
    .line 43
    :cond_1
    iget-object v0, p0, Landroidx/slice/SliceItem;->c:Ljava/lang/String;

    .line 44
    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    const/4 v1, 0x3

    .line 48
    invoke-virtual {p1, v0, v1}, Landroidx/versionedparcelable/a;->V(Ljava/lang/String;I)V

    .line 49
    .line 50
    .line 51
    :cond_2
    iget-object p0, p0, Landroidx/slice/SliceItem;->f:Landroidx/slice/SliceItemHolder;

    .line 52
    .line 53
    const/4 v0, 0x4

    .line 54
    invoke-virtual {p1, p0, v0}, Landroidx/versionedparcelable/a;->Z(Ll0/a;I)V

    .line 55
    .line 56
    .line 57
    return-void
.end method
