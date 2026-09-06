.class public final Landroidx/slice/SliceParcelizer;
.super Ljava/lang/Object;
.source "SliceParcelizer.java"


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

.method public static read(Landroidx/versionedparcelable/a;)Landroidx/slice/Slice;
    .locals 3

    .line 1
    new-instance v0, Landroidx/slice/Slice;

    .line 2
    .line 3
    invoke-direct {v0}, Landroidx/slice/Slice;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, v0, Landroidx/slice/Slice;->a:Landroidx/slice/SliceSpec;

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    invoke-virtual {p0, v1, v2}, Landroidx/versionedparcelable/a;->C(Ll0/a;I)Ll0/a;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Landroidx/slice/SliceSpec;

    .line 14
    .line 15
    iput-object v1, v0, Landroidx/slice/Slice;->a:Landroidx/slice/SliceSpec;

    .line 16
    .line 17
    iget-object v1, v0, Landroidx/slice/Slice;->b:[Landroidx/slice/SliceItem;

    .line 18
    .line 19
    const/4 v2, 0x2

    .line 20
    invoke-virtual {p0, v1, v2}, Landroidx/versionedparcelable/a;->i([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, [Landroidx/slice/SliceItem;

    .line 25
    .line 26
    iput-object v1, v0, Landroidx/slice/Slice;->b:[Landroidx/slice/SliceItem;

    .line 27
    .line 28
    iget-object v1, v0, Landroidx/slice/Slice;->c:[Ljava/lang/String;

    .line 29
    .line 30
    const/4 v2, 0x3

    .line 31
    invoke-virtual {p0, v1, v2}, Landroidx/versionedparcelable/a;->i([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, [Ljava/lang/String;

    .line 36
    .line 37
    iput-object v1, v0, Landroidx/slice/Slice;->c:[Ljava/lang/String;

    .line 38
    .line 39
    iget-object v1, v0, Landroidx/slice/Slice;->d:Ljava/lang/String;

    .line 40
    .line 41
    const/4 v2, 0x4

    .line 42
    invoke-virtual {p0, v1, v2}, Landroidx/versionedparcelable/a;->z(Ljava/lang/String;I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    iput-object p0, v0, Landroidx/slice/Slice;->d:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {v0}, Landroidx/slice/Slice;->g()V

    .line 49
    .line 50
    .line 51
    return-object v0
.end method

.method public static write(Landroidx/slice/Slice;Landroidx/versionedparcelable/a;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    invoke-virtual {p1, v1, v0}, Landroidx/versionedparcelable/a;->E(ZZ)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroidx/versionedparcelable/a;->g()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-virtual {p0, v0}, Landroidx/slice/Slice;->h(Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Landroidx/slice/Slice;->a:Landroidx/slice/SliceSpec;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1, v0, v1}, Landroidx/versionedparcelable/a;->Z(Ll0/a;I)V

    .line 18
    .line 19
    .line 20
    :cond_0
    sget-object v0, Landroidx/slice/Slice;->f:[Landroidx/slice/SliceItem;

    .line 21
    .line 22
    iget-object v1, p0, Landroidx/slice/Slice;->b:[Landroidx/slice/SliceItem;

    .line 23
    .line 24
    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Landroidx/slice/Slice;->b:[Landroidx/slice/SliceItem;

    .line 31
    .line 32
    const/4 v1, 0x2

    .line 33
    invoke-virtual {p1, v0, v1}, Landroidx/versionedparcelable/a;->G([Ljava/lang/Object;I)V

    .line 34
    .line 35
    .line 36
    :cond_1
    sget-object v0, Landroidx/slice/Slice;->e:[Ljava/lang/String;

    .line 37
    .line 38
    iget-object v1, p0, Landroidx/slice/Slice;->c:[Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-nez v0, :cond_2

    .line 45
    .line 46
    iget-object v0, p0, Landroidx/slice/Slice;->c:[Ljava/lang/String;

    .line 47
    .line 48
    const/4 v1, 0x3

    .line 49
    invoke-virtual {p1, v0, v1}, Landroidx/versionedparcelable/a;->G([Ljava/lang/Object;I)V

    .line 50
    .line 51
    .line 52
    :cond_2
    iget-object p0, p0, Landroidx/slice/Slice;->d:Ljava/lang/String;

    .line 53
    .line 54
    if-eqz p0, :cond_3

    .line 55
    .line 56
    const/4 v0, 0x4

    .line 57
    invoke-virtual {p1, p0, v0}, Landroidx/versionedparcelable/a;->V(Ljava/lang/String;I)V

    .line 58
    .line 59
    .line 60
    :cond_3
    return-void
.end method
