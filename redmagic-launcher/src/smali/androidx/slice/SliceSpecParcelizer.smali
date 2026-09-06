.class public final Landroidx/slice/SliceSpecParcelizer;
.super Ljava/lang/Object;
.source "SliceSpecParcelizer.java"


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

.method public static read(Landroidx/versionedparcelable/a;)Landroidx/slice/SliceSpec;
    .locals 3

    .line 1
    new-instance v0, Landroidx/slice/SliceSpec;

    .line 2
    .line 3
    invoke-direct {v0}, Landroidx/slice/SliceSpec;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, v0, Landroidx/slice/SliceSpec;->a:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    invoke-virtual {p0, v1, v2}, Landroidx/versionedparcelable/a;->z(Ljava/lang/String;I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iput-object v1, v0, Landroidx/slice/SliceSpec;->a:Ljava/lang/String;

    .line 14
    .line 15
    iget v1, v0, Landroidx/slice/SliceSpec;->b:I

    .line 16
    .line 17
    const/4 v2, 0x2

    .line 18
    invoke-virtual {p0, v1, v2}, Landroidx/versionedparcelable/a;->s(II)I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    iput p0, v0, Landroidx/slice/SliceSpec;->b:I

    .line 23
    .line 24
    return-object v0
.end method

.method public static write(Landroidx/slice/SliceSpec;Landroidx/versionedparcelable/a;)V
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
    iget-object v0, p0, Landroidx/slice/SliceSpec;->a:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {p1, v0, v1}, Landroidx/versionedparcelable/a;->V(Ljava/lang/String;I)V

    .line 9
    .line 10
    .line 11
    iget p0, p0, Landroidx/slice/SliceSpec;->b:I

    .line 12
    .line 13
    if-eq v1, p0, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    invoke-virtual {p1, p0, v0}, Landroidx/versionedparcelable/a;->O(II)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method
