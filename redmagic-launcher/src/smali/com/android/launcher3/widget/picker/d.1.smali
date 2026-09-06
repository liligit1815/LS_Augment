.class public Lcom/android/launcher3/widget/picker/d;
.super Ljava/lang/Object;
.source "WidgetRecommendationCategory.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Lcom/android/launcher3/widget/picker/d;",
        ">;"
    }
.end annotation


# static fields
.field public static i:Lcom/android/launcher3/widget/picker/d;


# instance fields
.field public final g:I

.field public final h:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/android/launcher3/widget/picker/d;

    .line 2
    .line 3
    const v1, 0x7f1402da

    .line 4
    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    invoke-direct {v0, v1, v2}, Lcom/android/launcher3/widget/picker/d;-><init>(II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/android/launcher3/widget/picker/d;->i:Lcom/android/launcher3/widget/picker/d;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/android/launcher3/widget/picker/d;->g:I

    .line 5
    .line 6
    iput p2, p0, Lcom/android/launcher3/widget/picker/d;->h:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Lcom/android/launcher3/widget/picker/d;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/widget/picker/d;->h:I

    .line 2
    .line 3
    iget p1, p1, Lcom/android/launcher3/widget/picker/d;->h:I

    .line 4
    .line 5
    sub-int/2addr p0, p1

    .line 6
    return p0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/widget/picker/d;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/picker/d;->a(Lcom/android/launcher3/widget/picker/d;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    instance-of v0, p1, Lcom/android/launcher3/widget/picker/d;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    check-cast p1, Lcom/android/launcher3/widget/picker/d;

    .line 7
    .line 8
    iget v0, p0, Lcom/android/launcher3/widget/picker/d;->g:I

    .line 9
    .line 10
    iget v2, p1, Lcom/android/launcher3/widget/picker/d;->g:I

    .line 11
    .line 12
    if-ne v0, v2, :cond_0

    .line 13
    .line 14
    iget p0, p0, Lcom/android/launcher3/widget/picker/d;->h:I

    .line 15
    .line 16
    iget p1, p1, Lcom/android/launcher3/widget/picker/d;->h:I

    .line 17
    .line 18
    if-ne p0, p1, :cond_0

    .line 19
    .line 20
    const/4 p0, 0x1

    .line 21
    return p0

    .line 22
    :cond_0
    return v1
.end method

.method public hashCode()I
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/widget/picker/d;->g:I

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget p0, p0, Lcom/android/launcher3/widget/picker/d;->h:I

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

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
    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method
