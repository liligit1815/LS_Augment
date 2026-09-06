.class public Lcom/android/launcher3/model/data/A;
.super Lcom/android/launcher3/model/data/y;
.source "LauncherAppWidgetInfo.java"


# instance fields
.field public g:I

.field public h:Landroid/content/ComponentName;

.field public i:I

.field public j:I

.field public k:Landroid/content/Intent;

.field public l:I

.field public m:Lcom/android/launcher3/model/data/B;

.field private n:I

.field public o:I

.field public p:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 16
    invoke-direct {p0}, Lcom/android/launcher3/model/data/y;-><init>()V

    const/4 v0, -0x1

    .line 17
    iput v0, p0, Lcom/android/launcher3/model/data/A;->g:I

    .line 18
    iput v0, p0, Lcom/android/launcher3/model/data/A;->j:I

    .line 19
    iput v0, p0, Lcom/android/launcher3/model/data/A;->o:I

    const/4 v0, 0x4

    .line 20
    iput v0, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    return-void
.end method

.method public constructor <init>(ILandroid/content/ComponentName;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/model/data/y;-><init>()V

    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lcom/android/launcher3/model/data/A;->j:I

    .line 3
    iput v0, p0, Lcom/android/launcher3/model/data/A;->o:I

    .line 4
    iput p1, p0, Lcom/android/launcher3/model/data/A;->g:I

    .line 5
    iput-object p2, p0, Lcom/android/launcher3/model/data/A;->h:Landroid/content/ComponentName;

    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/A;->z()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x5

    .line 7
    iput p1, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    goto :goto_0

    :cond_0
    const/4 p1, 0x4

    .line 8
    iput p1, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 9
    :goto_0
    iput v0, p0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 10
    iput v0, p0, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 11
    iput v0, p0, Lcom/android/launcher3/model/data/A;->n:I

    .line 12
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    move-result-object p1

    iput-object p1, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    const/4 p1, 0x0

    .line 13
    iput p1, p0, Lcom/android/launcher3/model/data/A;->i:I

    return-void
.end method

.method public constructor <init>(ILandroid/content/ComponentName;Lcom/android/launcher3/widget/U;Landroid/appwidget/AppWidgetHostView;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/model/data/A;-><init>(ILandroid/content/ComponentName;)V

    .line 15
    invoke-static {p3, p4}, Lcom/android/launcher3/model/data/A;->v(Lcom/android/launcher3/widget/U;Landroid/appwidget/AppWidgetHostView;)I

    move-result p1

    iput p1, p0, Lcom/android/launcher3/model/data/A;->n:I

    return-void
.end method

.method private static v(Lcom/android/launcher3/widget/U;Landroid/appwidget/AppWidgetHostView;)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/U;->D()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/widget/U;->z()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    or-int/lit8 v0, v0, 0x2

    .line 12
    .line 13
    :cond_0
    iget v1, p0, Landroid/appwidget/AppWidgetProviderInfo;->previewLayout:I

    .line 14
    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    or-int/lit8 v0, v0, 0x4

    .line 18
    .line 19
    :cond_1
    iget v1, p0, Landroid/appwidget/AppWidgetProviderInfo;->targetCellWidth:I

    .line 20
    .line 21
    if-gtz v1, :cond_2

    .line 22
    .line 23
    iget v1, p0, Landroid/appwidget/AppWidgetProviderInfo;->targetCellHeight:I

    .line 24
    .line 25
    if-lez v1, :cond_3

    .line 26
    .line 27
    :cond_2
    or-int/lit8 v0, v0, 0x8

    .line 28
    .line 29
    :cond_3
    iget v1, p0, Landroid/appwidget/AppWidgetProviderInfo;->minResizeWidth:I

    .line 30
    .line 31
    if-gtz v1, :cond_4

    .line 32
    .line 33
    iget v1, p0, Landroid/appwidget/AppWidgetProviderInfo;->minResizeHeight:I

    .line 34
    .line 35
    if-lez v1, :cond_5

    .line 36
    .line 37
    :cond_4
    or-int/lit8 v0, v0, 0x10

    .line 38
    .line 39
    :cond_5
    iget v1, p0, Landroid/appwidget/AppWidgetProviderInfo;->maxResizeWidth:I

    .line 40
    .line 41
    if-gtz v1, :cond_6

    .line 42
    .line 43
    iget p0, p0, Landroid/appwidget/AppWidgetProviderInfo;->maxResizeHeight:I

    .line 44
    .line 45
    if-lez p0, :cond_7

    .line 46
    .line 47
    :cond_6
    or-int/lit8 v0, v0, 0x20

    .line 48
    .line 49
    :cond_7
    instance-of p0, p1, Lcom/android/launcher3/widget/T;

    .line 50
    .line 51
    if-eqz p0, :cond_8

    .line 52
    .line 53
    check-cast p1, Lcom/android/launcher3/widget/T;

    .line 54
    .line 55
    invoke-virtual {p1}, Lcom/android/launcher3/widget/h;->t()Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    if-eqz p0, :cond_8

    .line 60
    .line 61
    or-int/lit8 p0, v0, 0x40

    .line 62
    .line 63
    return p0

    .line 64
    :cond_8
    return v0
.end method

.method public static w(I)Lcom/android/launcher3/logger/LauncherAtom$Attribute;
    .locals 1

    .line 1
    const/16 v0, -0x69

    .line 2
    .line 3
    if-eq p0, v0, :cond_1

    .line 4
    .line 5
    const/16 v0, -0x68

    .line 6
    .line 7
    if-eq p0, v0, :cond_0

    .line 8
    .line 9
    packed-switch p0, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    sget-object p0, Lcom/android/launcher3/logger/LauncherAtom$Attribute;->UNKNOWN:Lcom/android/launcher3/logger/LauncherAtom$Attribute;

    .line 13
    .line 14
    return-object p0

    .line 15
    :pswitch_0
    sget-object p0, Lcom/android/launcher3/logger/LauncherAtom$Attribute;->WIDGETS_TRAY_PREDICTION:Lcom/android/launcher3/logger/LauncherAtom$Attribute;

    .line 16
    .line 17
    return-object p0

    .line 18
    :pswitch_1
    sget-object p0, Lcom/android/launcher3/logger/LauncherAtom$Attribute;->WIDGETS_BOTTOM_TRAY:Lcom/android/launcher3/logger/LauncherAtom$Attribute;

    .line 19
    .line 20
    return-object p0

    .line 21
    :pswitch_2
    sget-object p0, Lcom/android/launcher3/logger/LauncherAtom$Attribute;->PINITEM:Lcom/android/launcher3/logger/LauncherAtom$Attribute;

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    sget-object p0, Lcom/android/launcher3/logger/LauncherAtom$Attribute;->ALL_APPS_SEARCH_RESULT_WIDGETS:Lcom/android/launcher3/logger/LauncherAtom$Attribute;

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_1
    sget-object p0, Lcom/android/launcher3/logger/LauncherAtom$Attribute;->WIDGETS:Lcom/android/launcher3/logger/LauncherAtom$Attribute;

    .line 28
    .line 29
    return-object p0

    .line 30
    nop

    .line 31
    :pswitch_data_0
    .packed-switch -0x71
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public final A()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/launcher3/model/data/A;->i:I

    .line 2
    .line 3
    and-int/lit8 v0, p0, 0x1

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    const/16 v0, 0x10

    .line 8
    .line 9
    and-int/2addr p0, v0

    .line 10
    if-ne p0, v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0

    .line 15
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 16
    return p0
.end method

.method public buildProto(Lcom/android/launcher3/model/data/m;Landroid/content/Context;)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/model/data/y;->buildProto(Lcom/android/launcher3/model/data/m;Landroid/content/Context;)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/google/protobuf/y;->toBuilder()Lcom/google/protobuf/y$a;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    check-cast p2, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;->getWidget()Lcom/android/launcher3/logger/LauncherAtom$Widget;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Lcom/google/protobuf/y;->toBuilder()Lcom/google/protobuf/y$a;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Lcom/android/launcher3/logger/LauncherAtom$Widget$Builder;

    .line 20
    .line 21
    iget v0, p0, Lcom/android/launcher3/model/data/A;->n:I

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Lcom/android/launcher3/logger/LauncherAtom$Widget$Builder;->setWidgetFeatures(I)Lcom/android/launcher3/logger/LauncherAtom$Widget$Builder;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p2, p1}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;->setWidget(Lcom/android/launcher3/logger/LauncherAtom$Widget$Builder;)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iget p0, p0, Lcom/android/launcher3/model/data/A;->o:I

    .line 32
    .line 33
    invoke-static {p0}, Lcom/android/launcher3/model/data/A;->w(I)Lcom/android/launcher3/logger/LauncherAtom$Attribute;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p1, p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;->addItemAttributes(Lcom/android/launcher3/logger/LauncherAtom$Attribute;)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;

    .line 46
    .line 47
    return-object p0
.end method

.method protected dumpProperties()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Lcom/android/launcher3/model/data/y;->dumpProperties()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " providerName="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/android/launcher3/model/data/A;->h:Landroid/content/ComponentName;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, " appWidgetId="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget p0, p0, Lcom/android/launcher3/model/data/A;->g:I

    .line 29
    .line 30
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public getTargetComponent()Landroid/content/ComponentName;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/model/data/A;->h:Landroid/content/ComponentName;

    .line 2
    .line 3
    return-object p0
.end method

.method public onAddToDatabase(Lcom/android/launcher3/util/G;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/model/data/y;->onAddToDatabase(Lcom/android/launcher3/util/G;)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/android/launcher3/model/data/A;->g:I

    .line 5
    .line 6
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v1, "appWidgetId"

    .line 11
    .line 12
    invoke-virtual {p1, v1, v0}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Lcom/android/launcher3/model/data/A;->h:Landroid/content/ComponentName;

    .line 17
    .line 18
    invoke-virtual {v1}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const-string v2, "appWidgetProvider"

    .line 23
    .line 24
    invoke-virtual {v0, v2, v1}, Lcom/android/launcher3/util/G;->t(Ljava/lang/String;Ljava/lang/String;)Lcom/android/launcher3/util/G;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget v1, p0, Lcom/android/launcher3/model/data/A;->i:I

    .line 29
    .line 30
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const-string v2, "restored"

    .line 35
    .line 36
    invoke-virtual {v0, v2, v1}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget v1, p0, Lcom/android/launcher3/model/data/A;->l:I

    .line 41
    .line 42
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    const-string v2, "options"

    .line 47
    .line 48
    invoke-virtual {v0, v2, v1}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    const-string v1, "intent"

    .line 53
    .line 54
    iget-object v3, p0, Lcom/android/launcher3/model/data/A;->k:Landroid/content/Intent;

    .line 55
    .line 56
    invoke-virtual {v0, v1, v3}, Lcom/android/launcher3/util/G;->d(Ljava/lang/String;Landroid/content/Intent;)Lcom/android/launcher3/util/G;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iget v1, p0, Lcom/android/launcher3/model/data/A;->o:I

    .line 61
    .line 62
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    const-string v3, "appWidgetSource"

    .line 67
    .line 68
    invoke-virtual {v0, v3, v1}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/y;->isShortcutAddFromOtherApp()Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_0

    .line 76
    .line 77
    iget p0, p0, Lcom/android/launcher3/model/data/A;->l:I

    .line 78
    .line 79
    or-int/lit16 p0, p0, 0x100

    .line 80
    .line 81
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {p1, v2, p0}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    .line 86
    .line 87
    .line 88
    :cond_0
    return-void
.end method

.method public final x(I)Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/model/data/A;->l:I

    .line 2
    .line 3
    and-int/2addr p0, p1

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public final y(I)Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/model/data/A;->i:I

    .line 2
    .line 3
    and-int/2addr p0, p1

    .line 4
    if-ne p0, p1, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public z()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/launcher3/model/data/A;->g:I

    .line 2
    .line 3
    const/16 v0, -0x64

    .line 4
    .line 5
    if-gt p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method
