.class public final Lcom/android/launcher3/widget/picker/c;
.super Ljava/lang/Object;
.source "WidgetCategoryFilter.kt"


# instance fields
.field private final a:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/android/launcher3/widget/picker/c;->a:I

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/widget/picker/c;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public final b(I)Z
    .locals 2

    .line 1
    iget p0, p0, Lcom/android/launcher3/widget/picker/c;->a:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x1

    .line 5
    if-lez p0, :cond_1

    .line 6
    .line 7
    and-int/2addr p0, p1

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    return v0

    .line 12
    :cond_1
    if-gez p0, :cond_3

    .line 13
    .line 14
    and-int/2addr p0, p1

    .line 15
    if-ne p0, p1, :cond_2

    .line 16
    .line 17
    return v1

    .line 18
    :cond_2
    return v0

    .line 19
    :cond_3
    return v1
.end method
