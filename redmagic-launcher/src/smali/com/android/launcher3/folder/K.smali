.class public Lcom/android/launcher3/folder/K;
.super Ljava/lang/Object;
.source "FolderNameInfos.java"


# instance fields
.field private a:I

.field private final b:[Ljava/lang/CharSequence;

.field private final c:[Ljava/lang/Float;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/android/launcher3/folder/K;->a:I

    .line 6
    .line 7
    const/4 v0, 0x4

    .line 8
    new-array v1, v0, [Ljava/lang/CharSequence;

    .line 9
    .line 10
    iput-object v1, p0, Lcom/android/launcher3/folder/K;->b:[Ljava/lang/CharSequence;

    .line 11
    .line 12
    new-array v0, v0, [Ljava/lang/Float;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/android/launcher3/folder/K;->c:[Ljava/lang/Float;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic a(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z
    .locals 0

    .line 1
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method


# virtual methods
.method public b(Ljava/lang/CharSequence;)Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/K;->b:[Ljava/lang/CharSequence;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/util/Arrays;->stream([Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Lcom/android/launcher3/folder/j;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/android/launcher3/folder/j;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance v0, Lcom/android/launcher3/folder/J;

    .line 17
    .line 18
    invoke-direct {v0, p1}, Lcom/android/launcher3/folder/J;-><init>(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0
.end method

.method public c()[Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/K;->b:[Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()[Ljava/lang/Float;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/K;->c:[Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Z
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/folder/K;->a:I

    .line 2
    .line 3
    and-int/lit8 v0, v0, 0x2

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-lez v0, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/launcher3/folder/K;->b:[Ljava/lang/CharSequence;

    .line 9
    .line 10
    aget-object p0, p0, v1

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    return v1
.end method

.method public f()Z
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/K;->b:[Ljava/lang/CharSequence;

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x0

    .line 5
    move v2, v1

    .line 6
    :goto_0
    if-ge v2, v0, :cond_1

    .line 7
    .line 8
    aget-object v3, p0, v2

    .line 9
    .line 10
    if-eqz v3, :cond_0

    .line 11
    .line 12
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    if-nez v3, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    return v1
.end method

.method public g(ILjava/lang/CharSequence;Ljava/lang/Float;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/K;->b:[Ljava/lang/CharSequence;

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    if-ge p1, v1, :cond_0

    .line 5
    .line 6
    aput-object p2, v0, p1

    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/launcher3/folder/K;->c:[Ljava/lang/Float;

    .line 9
    .line 10
    aput-object p3, p0, p1

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public h(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/folder/K;->a:I

    .line 2
    .line 3
    or-int/2addr p1, v0

    .line 4
    iput p1, p0, Lcom/android/launcher3/folder/K;->a:I

    .line 5
    .line 6
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/folder/K;->a:I

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Integer;->toBinaryString(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/android/launcher3/folder/K;->b:[Ljava/lang/CharSequence;

    .line 8
    .line 9
    invoke-static {p0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    filled-new-array {v0, p0}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v0, "status=%s, labels=%s"

    .line 18
    .line 19
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method
