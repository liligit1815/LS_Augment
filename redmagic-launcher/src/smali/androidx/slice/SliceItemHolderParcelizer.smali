.class public final Landroidx/slice/SliceItemHolderParcelizer;
.super Ljava/lang/Object;
.source "SliceItemHolderParcelizer.java"


# static fields
.field private static sBuilder:Landroidx/slice/SliceItemHolder$a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Landroidx/slice/SliceItemHolder$a;

    .line 2
    .line 3
    invoke-direct {v0}, Landroidx/slice/SliceItemHolder$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Landroidx/slice/SliceItemHolderParcelizer;->sBuilder:Landroidx/slice/SliceItemHolder$a;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static read(Landroidx/versionedparcelable/a;)Landroidx/slice/SliceItemHolder;
    .locals 4

    .line 1
    sget-object v0, Landroidx/slice/SliceItemHolderParcelizer;->sBuilder:Landroidx/slice/SliceItemHolder$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/slice/SliceItemHolder$a;->a()Landroidx/slice/SliceItemHolder;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, v0, Landroidx/slice/SliceItemHolder;->a:Ll0/a;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-virtual {p0, v1, v2}, Landroidx/versionedparcelable/a;->C(Ll0/a;I)Ll0/a;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, v0, Landroidx/slice/SliceItemHolder;->a:Ll0/a;

    .line 15
    .line 16
    iget-object v1, v0, Landroidx/slice/SliceItemHolder;->b:Landroid/os/Parcelable;

    .line 17
    .line 18
    const/4 v2, 0x2

    .line 19
    invoke-virtual {p0, v1, v2}, Landroidx/versionedparcelable/a;->w(Landroid/os/Parcelable;I)Landroid/os/Parcelable;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iput-object v1, v0, Landroidx/slice/SliceItemHolder;->b:Landroid/os/Parcelable;

    .line 24
    .line 25
    iget-object v1, v0, Landroidx/slice/SliceItemHolder;->d:Ljava/lang/String;

    .line 26
    .line 27
    const/4 v2, 0x3

    .line 28
    invoke-virtual {p0, v1, v2}, Landroidx/versionedparcelable/a;->z(Ljava/lang/String;I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iput-object v1, v0, Landroidx/slice/SliceItemHolder;->d:Ljava/lang/String;

    .line 33
    .line 34
    iget v1, v0, Landroidx/slice/SliceItemHolder;->e:I

    .line 35
    .line 36
    const/4 v2, 0x4

    .line 37
    invoke-virtual {p0, v1, v2}, Landroidx/versionedparcelable/a;->s(II)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    iput v1, v0, Landroidx/slice/SliceItemHolder;->e:I

    .line 42
    .line 43
    iget-wide v1, v0, Landroidx/slice/SliceItemHolder;->f:J

    .line 44
    .line 45
    const/4 v3, 0x5

    .line 46
    invoke-virtual {p0, v1, v2, v3}, Landroidx/versionedparcelable/a;->u(JI)J

    .line 47
    .line 48
    .line 49
    move-result-wide v1

    .line 50
    iput-wide v1, v0, Landroidx/slice/SliceItemHolder;->f:J

    .line 51
    .line 52
    return-object v0
.end method

.method public static write(Landroidx/slice/SliceItemHolder;Landroidx/versionedparcelable/a;)V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p1, v0, v0}, Landroidx/versionedparcelable/a;->E(ZZ)V

    .line 3
    .line 4
    .line 5
    iget-object v1, p0, Landroidx/slice/SliceItemHolder;->a:Ll0/a;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1, v1, v0}, Landroidx/versionedparcelable/a;->Z(Ll0/a;I)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Landroidx/slice/SliceItemHolder;->b:Landroid/os/Parcelable;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    invoke-virtual {p1, v0, v1}, Landroidx/versionedparcelable/a;->S(Landroid/os/Parcelable;I)V

    .line 18
    .line 19
    .line 20
    :cond_1
    iget-object v0, p0, Landroidx/slice/SliceItemHolder;->d:Ljava/lang/String;

    .line 21
    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    const/4 v1, 0x3

    .line 25
    invoke-virtual {p1, v0, v1}, Landroidx/versionedparcelable/a;->V(Ljava/lang/String;I)V

    .line 26
    .line 27
    .line 28
    :cond_2
    iget v0, p0, Landroidx/slice/SliceItemHolder;->e:I

    .line 29
    .line 30
    if-eqz v0, :cond_3

    .line 31
    .line 32
    const/4 v1, 0x4

    .line 33
    invoke-virtual {p1, v0, v1}, Landroidx/versionedparcelable/a;->O(II)V

    .line 34
    .line 35
    .line 36
    :cond_3
    iget-wide v0, p0, Landroidx/slice/SliceItemHolder;->f:J

    .line 37
    .line 38
    const-wide/16 v2, 0x0

    .line 39
    .line 40
    cmp-long p0, v2, v0

    .line 41
    .line 42
    if-eqz p0, :cond_4

    .line 43
    .line 44
    const/4 p0, 0x5

    .line 45
    invoke-virtual {p1, v0, v1, p0}, Landroidx/versionedparcelable/a;->Q(JI)V

    .line 46
    .line 47
    .line 48
    :cond_4
    return-void
.end method
