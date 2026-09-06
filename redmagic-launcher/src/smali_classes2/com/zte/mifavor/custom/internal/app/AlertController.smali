.class public Lcom/zte/mifavor/custom/internal/app/AlertController;
.super Ljava/lang/Object;
.source "AlertController.java"


# static fields
.field private static final BIT_BUTTON_NEGATIVE:I = 0x2

.field private static final BIT_BUTTON_NEUTRAL:I = 0x4

.field private static final BIT_BUTTON_POSITIVE:I = 0x1

.field private static final TAG:Ljava/lang/String; = "AlertControllerCustom"


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

.method public static AlertController_getDialogStyle([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object p0, p0, v0

    .line 3
    .line 4
    check-cast p0, Landroid/content/Context;

    .line 5
    .line 6
    invoke-static {p0}, Lcom/zte/mifavor/custom/Config;->isMifavorTheme(Landroid/content/Context;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 p0, 0x7

    .line 15
    new-array p0, p0, [Ljava/lang/Object;

    .line 16
    .line 17
    sget v1, LR3/i;->c:I

    .line 18
    .line 19
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    aput-object v1, p0, v0

    .line 24
    .line 25
    sget v0, LR3/i;->n:I

    .line 26
    .line 27
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const/4 v1, 0x2

    .line 32
    aput-object v0, p0, v1

    .line 33
    .line 34
    sget v0, LR3/i;->p:I

    .line 35
    .line 36
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const/4 v1, 0x3

    .line 41
    aput-object v0, p0, v1

    .line 42
    .line 43
    sget v0, LR3/i;->r:I

    .line 44
    .line 45
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const/4 v1, 0x4

    .line 50
    aput-object v0, p0, v1

    .line 51
    .line 52
    sget v0, LR3/i;->l:I

    .line 53
    .line 54
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    const/4 v1, 0x5

    .line 59
    aput-object v0, p0, v1

    .line 60
    .line 61
    new-instance v0, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 64
    .line 65
    .line 66
    const-string v1, "getDialogRes:"

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-static {p0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    const-string v1, "AlertControllerCustom"

    .line 83
    .line 84
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    .line 86
    .line 87
    return-object p0
.end method

.method public static setupView_begin([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 14

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object v1, p0, v0

    .line 3
    .line 4
    check-cast v1, Landroid/content/Context;

    .line 5
    .line 6
    invoke-static {v1}, Lcom/zte/mifavor/custom/Config;->isMifavorTheme(Landroid/content/Context;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x0

    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    return-object v2

    .line 14
    :cond_0
    const-string v1, "AlertControllerCustom"

    .line 15
    .line 16
    const-string v3, "setup begin"

    .line 17
    .line 18
    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 19
    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    aget-object v1, p0, v1

    .line 23
    .line 24
    check-cast v1, Landroid/view/Window;

    .line 25
    .line 26
    sget v3, LR3/g;->V:I

    .line 27
    .line 28
    sget v4, LR3/g;->E0:I

    .line 29
    .line 30
    sget v5, LR3/g;->p:I

    .line 31
    .line 32
    sget v6, LR3/g;->r:I

    .line 33
    .line 34
    sget v7, LR3/g;->j:I

    .line 35
    .line 36
    sget v8, LR3/g;->D0:I

    .line 37
    .line 38
    sget v9, LR3/g;->a:I

    .line 39
    .line 40
    sget v10, LR3/g;->A0:I

    .line 41
    .line 42
    sget v11, LR3/g;->j0:I

    .line 43
    .line 44
    sget v12, LR3/g;->x0:I

    .line 45
    .line 46
    sget v13, LR3/g;->w0:I

    .line 47
    .line 48
    filled-new-array/range {v3 .. v13}, [I

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    const/4 v4, 0x5

    .line 53
    :goto_0
    const/16 v5, 0xb

    .line 54
    .line 55
    if-ge v0, v5, :cond_2

    .line 56
    .line 57
    aget v5, v3, v0

    .line 58
    .line 59
    invoke-virtual {v1, v5}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v5

    .line 63
    if-eqz v5, :cond_1

    .line 64
    .line 65
    aget-object v6, p0, v4

    .line 66
    .line 67
    check-cast v6, Ljava/lang/Integer;

    .line 68
    .line 69
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 70
    .line 71
    .line 72
    move-result v6

    .line 73
    invoke-virtual {v5, v6}, Landroid/view/View;->setId(I)V

    .line 74
    .line 75
    .line 76
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 77
    .line 78
    add-int/lit8 v4, v4, 0x1

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_2
    return-object v2
.end method

.method public static setupView_end([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object v1, p0, v0

    .line 3
    .line 4
    check-cast v1, Landroid/content/Context;

    .line 5
    .line 6
    const/4 v2, 0x1

    .line 7
    aget-object v2, p0, v2

    .line 8
    .line 9
    check-cast v2, Landroid/view/Window;

    .line 10
    .line 11
    const/4 v2, 0x2

    .line 12
    aget-object v2, p0, v2

    .line 13
    .line 14
    check-cast v2, Landroid/widget/ListView;

    .line 15
    .line 16
    invoke-static {v1}, Lcom/zte/mifavor/custom/Config;->isMifavorTheme(Landroid/content/Context;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    const/4 v3, 0x0

    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    return-object v3

    .line 24
    :cond_0
    const-string v1, "AlertControllerCustom"

    .line 25
    .line 26
    const-string v4, "setup end."

    .line 27
    .line 28
    invoke-static {v1, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    const/4 v1, 0x7

    .line 32
    aget-object p0, p0, v1

    .line 33
    .line 34
    check-cast p0, Landroid/view/View;

    .line 35
    .line 36
    if-eqz v2, :cond_1

    .line 37
    .line 38
    invoke-virtual {v2}, Landroid/widget/ListView;->getPaddingLeft()I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    invoke-virtual {v2}, Landroid/widget/ListView;->getPaddingRight()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    invoke-virtual {v2, p0, v0, v1, v0}, Landroid/widget/ListView;->setPadding(IIII)V

    .line 47
    .line 48
    .line 49
    :cond_1
    return-object v3
.end method
