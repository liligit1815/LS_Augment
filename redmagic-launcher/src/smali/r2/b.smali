.class public final Lr2/b;
.super Ljava/lang/Object;
.source "WidgetSizes.java"


# static fields
.field public static a:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "ru.yandex.music"

    .line 2
    .line 3
    filled-new-array {v0}, [Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lr2/b;->a:[Ljava/lang/String;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a(Landroid/content/Context;Landroid/appwidget/AppWidgetProviderInfo;III)V
    .locals 1

    .line 1
    invoke-static {p0}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p1, p1, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 6
    .line 7
    invoke-static {p0, p1, p2, p3}, Lr2/b;->d(Landroid/content/Context;Landroid/content/ComponentName;II)Landroid/os/Bundle;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string p1, "appWidgetSizes"

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-virtual {v0, p4}, Landroid/appwidget/AppWidgetManager;->getAppWidgetOptions(I)Landroid/os/Bundle;

    .line 18
    .line 19
    .line 20
    move-result-object p3

    .line 21
    invoke-virtual {p3, p1}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    invoke-virtual {v0, p4, p0}, Landroid/appwidget/AppWidgetManager;->updateAppWidgetOptions(ILandroid/os/Bundle;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method private static b(Ljava/util/List;)Landroid/graphics/Rect;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/SizeF;",
            ">;)",
            "Landroid/graphics/Rect;"
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance p0, Landroid/graphics/Rect;

    .line 8
    .line 9
    invoke-direct {p0}, Landroid/graphics/Rect;-><init>()V

    .line 10
    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Landroid/util/SizeF;

    .line 19
    .line 20
    new-instance v1, Landroid/graphics/Rect;

    .line 21
    .line 22
    invoke-virtual {v0}, Landroid/util/SizeF;->getWidth()F

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    float-to-int v2, v2

    .line 27
    invoke-virtual {v0}, Landroid/util/SizeF;->getHeight()F

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    float-to-int v3, v3

    .line 32
    invoke-virtual {v0}, Landroid/util/SizeF;->getWidth()F

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    float-to-int v4, v4

    .line 37
    invoke-virtual {v0}, Landroid/util/SizeF;->getHeight()F

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    float-to-int v0, v0

    .line 42
    invoke-direct {v1, v2, v3, v4, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 43
    .line 44
    .line 45
    const/4 v0, 0x1

    .line 46
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-ge v0, v2, :cond_1

    .line 51
    .line 52
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    check-cast v2, Landroid/util/SizeF;

    .line 57
    .line 58
    invoke-virtual {v2}, Landroid/util/SizeF;->getWidth()F

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    float-to-int v2, v2

    .line 63
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    check-cast v3, Landroid/util/SizeF;

    .line 68
    .line 69
    invoke-virtual {v3}, Landroid/util/SizeF;->getHeight()F

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    float-to-int v3, v3

    .line 74
    invoke-virtual {v1, v2, v3}, Landroid/graphics/Rect;->union(II)V

    .line 75
    .line 76
    .line 77
    add-int/lit8 v0, v0, 0x1

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_1
    return-object v1
.end method

.method public static c(Landroid/content/Context;Lcom/android/launcher3/h0;Lz1/Z4;)Landroid/util/Size;
    .locals 1

    .line 1
    invoke-virtual {p2}, Lz1/Z4;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget p1, p1, Lcom/android/launcher3/h0;->J2:I

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const p2, 0x7f070c90

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    mul-int/lit8 p0, p0, 0x2

    .line 21
    .line 22
    add-int/2addr p1, p0

    .line 23
    new-instance p0, Landroid/util/Size;

    .line 24
    .line 25
    invoke-direct {p0, p1, p1}, Landroid/util/Size;-><init>(II)V

    .line 26
    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_0
    iget p0, p2, Lz1/Z4;->i:I

    .line 30
    .line 31
    iget p2, p2, Lz1/Z4;->j:I

    .line 32
    .line 33
    invoke-static {p1, p0, p2}, Lr2/b;->e(Lcom/android/launcher3/h0;II)Landroid/util/Size;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public static d(Landroid/content/Context;Landroid/content/ComponentName;II)Landroid/os/Bundle;
    .locals 3

    .line 1
    invoke-static {p0, p2, p3}, Lr2/b;->g(Landroid/content/Context;II)Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    sget-object v1, Lr2/b;->a:[Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-interface {v1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-static {p0, p2, p3, p1}, Lr2/b;->h(Landroid/content/Context;IILandroid/content/ComponentName;)Ljava/util/ArrayList;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    :cond_0
    invoke-static {v0}, Lr2/b;->b(Ljava/util/List;)Landroid/graphics/Rect;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    new-instance p2, Landroid/os/Bundle;

    .line 32
    .line 33
    invoke-direct {p2}, Landroid/os/Bundle;-><init>()V

    .line 34
    .line 35
    .line 36
    iget p3, p0, Landroid/graphics/Rect;->left:I

    .line 37
    .line 38
    const-string v1, "appWidgetMinWidth"

    .line 39
    .line 40
    invoke-virtual {p2, v1, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 41
    .line 42
    .line 43
    const-string p3, "appWidgetMinHeight"

    .line 44
    .line 45
    iget v1, p0, Landroid/graphics/Rect;->top:I

    .line 46
    .line 47
    invoke-virtual {p2, p3, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 48
    .line 49
    .line 50
    const-string p3, "appWidgetMaxWidth"

    .line 51
    .line 52
    iget v1, p0, Landroid/graphics/Rect;->right:I

    .line 53
    .line 54
    invoke-virtual {p2, p3, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 55
    .line 56
    .line 57
    const-string p3, "appWidgetMaxHeight"

    .line 58
    .line 59
    iget v1, p0, Landroid/graphics/Rect;->bottom:I

    .line 60
    .line 61
    invoke-virtual {p2, p3, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 62
    .line 63
    .line 64
    const-string p3, "appWidgetSizes"

    .line 65
    .line 66
    invoke-virtual {p2, p3, v0}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 67
    .line 68
    .line 69
    new-instance p3, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 72
    .line 73
    .line 74
    const-string v1, "provider: "

    .line 75
    .line 76
    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    const-string p1, ", paddedSizes: "

    .line 83
    .line 84
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    const-string p1, ", getMinMaxSizes: "

    .line 91
    .line 92
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    const-string p1, "b/267448330"

    .line 103
    .line 104
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    .line 106
    .line 107
    return-object p2
.end method

.method public static e(Lcom/android/launcher3/h0;II)Landroid/util/Size;
    .locals 5

    .line 1
    add-int/lit8 v0, p1, -0x1

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/h0;->p1:Landroid/graphics/Point;

    .line 4
    .line 5
    iget v2, v1, Landroid/graphics/Point;->x:I

    .line 6
    .line 7
    mul-int/2addr v0, v2

    .line 8
    add-int/lit8 v2, p2, -0x1

    .line 9
    .line 10
    iget v1, v1, Landroid/graphics/Point;->y:I

    .line 11
    .line 12
    mul-int/2addr v2, v1

    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {p0, v1}, Lcom/android/launcher3/X3;->g(Landroid/graphics/Point;)Landroid/graphics/Point;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object p0, p0, Lcom/android/launcher3/h0;->m3:Landroid/graphics/Rect;

    .line 19
    .line 20
    new-instance v3, Landroid/util/Size;

    .line 21
    .line 22
    iget v4, v1, Landroid/graphics/Point;->x:I

    .line 23
    .line 24
    mul-int/2addr p1, v4

    .line 25
    add-int/2addr p1, v0

    .line 26
    iget v0, p0, Landroid/graphics/Rect;->left:I

    .line 27
    .line 28
    sub-int/2addr p1, v0

    .line 29
    iget v0, p0, Landroid/graphics/Rect;->right:I

    .line 30
    .line 31
    sub-int/2addr p1, v0

    .line 32
    iget v0, v1, Landroid/graphics/Point;->y:I

    .line 33
    .line 34
    mul-int/2addr p2, v0

    .line 35
    add-int/2addr p2, v2

    .line 36
    iget v0, p0, Landroid/graphics/Rect;->top:I

    .line 37
    .line 38
    sub-int/2addr p2, v0

    .line 39
    iget p0, p0, Landroid/graphics/Rect;->bottom:I

    .line 40
    .line 41
    sub-int/2addr p2, p0

    .line 42
    invoke-direct {v3, p1, p2}, Landroid/util/Size;-><init>(II)V

    .line 43
    .line 44
    .line 45
    return-object v3
.end method

.method public static f(Lcom/android/launcher3/h0;IILandroid/graphics/Rect;)Landroid/util/Size;
    .locals 4

    .line 1
    add-int/lit8 v0, p1, -0x1

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/h0;->p1:Landroid/graphics/Point;

    .line 4
    .line 5
    iget v2, v1, Landroid/graphics/Point;->x:I

    .line 6
    .line 7
    mul-int/2addr v0, v2

    .line 8
    add-int/lit8 v2, p2, -0x1

    .line 9
    .line 10
    iget v1, v1, Landroid/graphics/Point;->y:I

    .line 11
    .line 12
    mul-int/2addr v2, v1

    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {p0, v1}, Lcom/android/launcher3/X3;->g(Landroid/graphics/Point;)Landroid/graphics/Point;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    new-instance v1, Landroid/util/Size;

    .line 19
    .line 20
    iget v3, p0, Landroid/graphics/Point;->x:I

    .line 21
    .line 22
    mul-int/2addr p1, v3

    .line 23
    add-int/2addr p1, v0

    .line 24
    iget v0, p3, Landroid/graphics/Rect;->left:I

    .line 25
    .line 26
    sub-int/2addr p1, v0

    .line 27
    iget v0, p3, Landroid/graphics/Rect;->right:I

    .line 28
    .line 29
    sub-int/2addr p1, v0

    .line 30
    iget p0, p0, Landroid/graphics/Point;->y:I

    .line 31
    .line 32
    mul-int/2addr p2, p0

    .line 33
    add-int/2addr p2, v2

    .line 34
    iget p0, p3, Landroid/graphics/Rect;->top:I

    .line 35
    .line 36
    sub-int/2addr p2, p0

    .line 37
    iget p0, p3, Landroid/graphics/Rect;->bottom:I

    .line 38
    .line 39
    sub-int/2addr p2, p0

    .line 40
    invoke-direct {v1, p1, p2}, Landroid/util/Size;-><init>(II)V

    .line 41
    .line 42
    .line 43
    return-object v1
.end method

.method public static g(Landroid/content/Context;II)Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "II)",
            "Ljava/util/ArrayList<",
            "Landroid/util/SizeF;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    .line 16
    .line 17
    invoke-static {p0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget-object p0, p0, Lcom/android/launcher3/F1;->I1:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_0

    .line 32
    .line 33
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    check-cast v2, Lcom/android/launcher3/h0;

    .line 38
    .line 39
    invoke-static {v2, p1, p2}, Lr2/b;->e(Lcom/android/launcher3/h0;II)Landroid/util/Size;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    new-instance v3, Landroid/util/SizeF;

    .line 44
    .line 45
    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    int-to-float v4, v4

    .line 50
    div-float/2addr v4, v1

    .line 51
    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    int-to-float v2, v2

    .line 56
    div-float/2addr v2, v1

    .line 57
    invoke-direct {v3, v4, v2}, Landroid/util/SizeF;-><init>(FF)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    return-object v0
.end method

.method public static h(Landroid/content/Context;IILandroid/content/ComponentName;)Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "II",
            "Landroid/content/ComponentName;",
            ")",
            "Ljava/util/ArrayList<",
            "Landroid/util/SizeF;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    .line 16
    .line 17
    new-instance v2, Landroid/graphics/Rect;

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    invoke-direct {v2, v3, v3, v3, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 21
    .line 22
    .line 23
    invoke-static {p0, p3, v2}, Landroid/appwidget/AppWidgetHostView;->getDefaultPaddingForWidget(Landroid/content/Context;Landroid/content/ComponentName;Landroid/graphics/Rect;)Landroid/graphics/Rect;

    .line 24
    .line 25
    .line 26
    invoke-static {p0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    iget-object p0, p0, Lcom/android/launcher3/F1;->I1:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 37
    .line 38
    .line 39
    move-result p3

    .line 40
    if-eqz p3, :cond_0

    .line 41
    .line 42
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p3

    .line 46
    check-cast p3, Lcom/android/launcher3/h0;

    .line 47
    .line 48
    invoke-static {p3, p1, p2, v2}, Lr2/b;->f(Lcom/android/launcher3/h0;IILandroid/graphics/Rect;)Landroid/util/Size;

    .line 49
    .line 50
    .line 51
    move-result-object p3

    .line 52
    new-instance v3, Landroid/util/SizeF;

    .line 53
    .line 54
    invoke-virtual {p3}, Landroid/util/Size;->getWidth()I

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    int-to-float v4, v4

    .line 59
    div-float/2addr v4, v1

    .line 60
    invoke-virtual {p3}, Landroid/util/Size;->getHeight()I

    .line 61
    .line 62
    .line 63
    move-result p3

    .line 64
    int-to-float p3, p3

    .line 65
    div-float/2addr p3, v1

    .line 66
    invoke-direct {v3, v4, p3}, Landroid/util/SizeF;-><init>(FF)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_0
    return-object v0
.end method

.method public static i(Landroid/appwidget/AppWidgetHostView;Landroid/content/Context;II)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetId()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {v0, p0, p1, p2, p3}, Lr2/b;->j(ILandroid/appwidget/AppWidgetProviderInfo;Landroid/content/Context;II)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static j(ILandroid/appwidget/AppWidgetProviderInfo;Landroid/content/Context;II)V
    .locals 7

    .line 1
    if-lez p0, :cond_0

    .line 2
    .line 3
    if-nez p1, :cond_1

    .line 4
    .line 5
    :cond_0
    move v6, p0

    .line 6
    goto :goto_0

    .line 7
    :cond_1
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 8
    .line 9
    new-instance v1, Lr2/a;

    .line 10
    .line 11
    move v6, p0

    .line 12
    move-object v3, p1

    .line 13
    move-object v2, p2

    .line 14
    move v4, p3

    .line 15
    move v5, p4

    .line 16
    invoke-direct/range {v1 .. v6}, Lr2/a;-><init>(Landroid/content/Context;Landroid/appwidget/AppWidgetProviderInfo;III)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 26
    .line 27
    .line 28
    const-string p1, "updateWidgetSizeRangesAsync:  widgetId: "

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const-string p1, "WidgetSizes"

    .line 41
    .line 42
    invoke-static {p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    return-void
.end method
