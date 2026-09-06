.class public final Lcom/android/launcher3/util/z2;
.super Ljava/lang/Object;
.source "StableViewInfo.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/util/z2$a;
    }
.end annotation


# static fields
.field public static final d:Lcom/android/launcher3/util/z2$a;


# instance fields
.field private final a:I

.field private final b:I

.field private final c:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/z2$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/z2$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/launcher3/util/z2;->d:Lcom/android/launcher3/util/z2$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(IILjava/lang/Object;)V
    .locals 1

    .line 1
    const-string v0, "stableId"

    .line 2
    .line 3
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput p1, p0, Lcom/android/launcher3/util/z2;->a:I

    .line 10
    .line 11
    iput p2, p0, Lcom/android/launcher3/util/z2;->b:I

    .line 12
    .line 13
    iput-object p3, p0, Lcom/android/launcher3/util/z2;->c:Ljava/lang/Object;

    .line 14
    .line 15
    return-void
.end method

.method public static final a(Ljava/util/List;)Lcom/android/launcher3/util/z2;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Landroid/os/IBinder;",
            ">;)",
            "Lcom/android/launcher3/util/z2;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/android/launcher3/util/z2;->d:Lcom/android/launcher3/util/z2$a;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/z2$a;->a(Ljava/util/List;)Lcom/android/launcher3/util/z2;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static final c(Lcom/android/launcher3/model/data/y;)Landroid/os/IBinder;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/util/z2;->d:Lcom/android/launcher3/util/z2$a;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/z2$a;->b(Lcom/android/launcher3/model/data/y;)Landroid/os/IBinder;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method


# virtual methods
.method public final b(Lcom/android/launcher3/model/data/y;)Z
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget v0, p0, Lcom/android/launcher3/util/z2;->a:I

    .line 4
    .line 5
    iget v1, p1, Lcom/android/launcher3/model/data/y;->id:I

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    iget v0, p0, Lcom/android/launcher3/util/z2;->b:I

    .line 10
    .line 11
    iget v1, p1, Lcom/android/launcher3/model/data/y;->container:I

    .line 12
    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/launcher3/util/z2;->c:Ljava/lang/Object;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getStableId()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/android/launcher3/util/z2;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, Lcom/android/launcher3/util/z2;

    .line 12
    .line 13
    iget v1, p0, Lcom/android/launcher3/util/z2;->a:I

    .line 14
    .line 15
    iget v3, p1, Lcom/android/launcher3/util/z2;->a:I

    .line 16
    .line 17
    if-eq v1, v3, :cond_2

    .line 18
    .line 19
    return v2

    .line 20
    :cond_2
    iget v1, p0, Lcom/android/launcher3/util/z2;->b:I

    .line 21
    .line 22
    iget v3, p1, Lcom/android/launcher3/util/z2;->b:I

    .line 23
    .line 24
    if-eq v1, v3, :cond_3

    .line 25
    .line 26
    return v2

    .line 27
    :cond_3
    iget-object p0, p0, Lcom/android/launcher3/util/z2;->c:Ljava/lang/Object;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/android/launcher3/util/z2;->c:Ljava/lang/Object;

    .line 30
    .line 31
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-nez p0, :cond_4

    .line 36
    .line 37
    return v2

    .line 38
    :cond_4
    return v0
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/util/z2;->a:I

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    mul-int/lit8 v0, v0, 0x1f

    .line 8
    .line 9
    iget v1, p0, Lcom/android/launcher3/util/z2;->b:I

    .line 10
    .line 11
    invoke-static {v1}, Ljava/lang/Integer;->hashCode(I)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    add-int/2addr v0, v1

    .line 16
    mul-int/lit8 v0, v0, 0x1f

    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/launcher3/util/z2;->c:Ljava/lang/Object;

    .line 19
    .line 20
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    add-int/2addr v0, p0

    .line 25
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 1
    iget v0, p0, Lcom/android/launcher3/util/z2;->a:I

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/util/z2;->b:I

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/util/z2;->c:Ljava/lang/Object;

    .line 6
    .line 7
    new-instance v2, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v3, "StableViewInfo(itemId="

    .line 13
    .line 14
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v0, ", containerId="

    .line 21
    .line 22
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v0, ", stableId="

    .line 29
    .line 30
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string p0, ")"

    .line 37
    .line 38
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method
