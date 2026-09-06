.class public Lk2/b;
.super Lcom/android/launcher3/widget/U;
.source "CustomAppWidgetProviderInfo.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lk2/b;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lk2/b$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lk2/b$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lk2/b;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 7
    .line 8
    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/android/launcher3/widget/U;-><init>()V

    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;Lcom/android/systemui/plugins/CustomWidgetPlugin;Landroid/content/ComponentName;)V
    .locals 4

    .line 14
    invoke-direct {p0}, Lcom/android/launcher3/widget/U;-><init>()V

    .line 15
    iput-object p3, p0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 16
    invoke-interface {p2}, Lcom/android/systemui/plugins/CustomWidgetPlugin;->getLabel()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/appwidget/AppWidgetProviderInfo;->label:Ljava/lang/String;

    .line 17
    invoke-interface {p2}, Lcom/android/systemui/plugins/CustomWidgetPlugin;->getPreviewImage()I

    move-result v0

    iput v0, p0, Landroid/appwidget/AppWidgetProviderInfo;->previewImage:I

    .line 18
    invoke-interface {p2}, Lcom/android/systemui/plugins/CustomWidgetPlugin;->getSpanX()I

    move-result v0

    iput v0, p0, Lcom/android/launcher3/widget/U;->g:I

    .line 19
    invoke-interface {p2}, Lcom/android/systemui/plugins/CustomWidgetPlugin;->getSpanY()I

    move-result v0

    iput v0, p0, Lcom/android/launcher3/widget/U;->h:I

    .line 20
    invoke-interface {p2}, Lcom/android/systemui/plugins/CustomWidgetPlugin;->getMinSpanX()I

    move-result v0

    iput v0, p0, Lcom/android/launcher3/widget/U;->i:I

    .line 21
    invoke-interface {p2}, Lcom/android/systemui/plugins/CustomWidgetPlugin;->getMinSpanY()I

    move-result v0

    iput v0, p0, Lcom/android/launcher3/widget/U;->j:I

    .line 22
    invoke-interface {p2}, Lcom/android/systemui/plugins/CustomWidgetPlugin;->getResizeMode()I

    move-result p2

    iput p2, p0, Landroid/appwidget/AppWidgetProviderInfo;->resizeMode:I

    if-nez p2, :cond_0

    .line 23
    iget p2, p0, Lcom/android/launcher3/widget/U;->g:I

    iput p2, p0, Lcom/android/launcher3/widget/U;->i:I

    .line 24
    iget p2, p0, Lcom/android/launcher3/widget/U;->h:I

    iput p2, p0, Lcom/android/launcher3/widget/U;->j:I

    .line 25
    :cond_0
    invoke-direct {p0, p1}, Lk2/b;->G(Landroid/content/Context;)V

    const/4 p2, 0x0

    const/4 v0, 0x1

    if-eqz p3, :cond_1

    .line 26
    invoke-virtual {p3}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 27
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p3}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v1

    const-class v2, Lcom/android/launcher3/widget/custom/group/GroupCustomWidget;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    move v1, v0

    goto :goto_0

    :cond_1
    move v1, p2

    :goto_0
    if-eqz p3, :cond_2

    .line 28
    invoke-virtual {p3}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 29
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p3}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-virtual {p3}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object p3

    const-class v2, Lcom/android/launcher3/widget/custom/future/AIFutureWidget;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p3, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_2

    move p2, v0

    .line 30
    :cond_2
    invoke-virtual {p0, v1}, Lcom/android/launcher3/widget/U;->F(Z)V

    .line 31
    invoke-virtual {p0, p2}, Lcom/android/launcher3/widget/U;->E(Z)V

    .line 32
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/U;->w(Landroid/content/Context;)V

    .line 33
    invoke-static {p1}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lk2/b;->v(Landroid/content/Context;Lcom/android/launcher3/F1;)V

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;Z)V
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/U;-><init>(Landroid/os/Parcel;)V

    if-eqz p2, :cond_0

    .line 2
    new-instance p2, Landroid/content/ComponentName;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "#custom-widget-"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p2, v0, v1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object p2, p0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 4
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Landroid/appwidget/AppWidgetProviderInfo;->label:Ljava/lang/String;

    .line 5
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p2

    iput p2, p0, Landroid/appwidget/AppWidgetProviderInfo;->initialLayout:I

    .line 6
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p2

    iput p2, p0, Landroid/appwidget/AppWidgetProviderInfo;->icon:I

    .line 7
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p2

    iput p2, p0, Landroid/appwidget/AppWidgetProviderInfo;->previewImage:I

    .line 8
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p2

    iput p2, p0, Landroid/appwidget/AppWidgetProviderInfo;->resizeMode:I

    .line 9
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/widget/U;->g:I

    .line 10
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/widget/U;->h:I

    .line 11
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/widget/U;->i:I

    .line 12
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/android/launcher3/widget/U;->j:I

    :cond_0
    return-void
.end method

.method private G(Landroid/content/Context;)V
    .locals 3

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-string v1, "android.intent.action.MAIN"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    const-string v1, "android.intent.category.HOME"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const/high16 v1, 0x10000

    .line 25
    .line 26
    invoke-virtual {p1, v0, v1}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_0

    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    check-cast p1, Landroid/content/pm/ResolveInfo;

    .line 42
    .line 43
    iget-object p1, p1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    const/4 p1, 0x0

    .line 47
    :goto_0
    const-string v0, "CustomAppWidgetProviderInfo"

    .line 48
    .line 49
    if-eqz p1, :cond_1

    .line 50
    .line 51
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    const-string v2, "providerInfo"

    .line 56
    .line 57
    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    const/4 v2, 0x1

    .line 62
    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1, p0, p1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :catchall_0
    move-exception p0

    .line 70
    const-string p1, "CustomAppWidgetProviderInfo init set providerInfo error"

    .line 71
    .line 72
    invoke-static {v0, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_1
    const-string p0, "initProviderInfo error, activityInfo null, launcher may will repeat crash when getProfile on WidgetsModel.update new WidgetItem"

    .line 77
    .line 78
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    .line 80
    .line 81
    return-void
.end method


# virtual methods
.method public getLabel()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/appwidget/AppWidgetProviderInfo;->label:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/N5;->g0(Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "WidgetProviderInfo("

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string p0, ")"

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public v(Landroid/content/Context;Lcom/android/launcher3/F1;)V
    .locals 2

    .line 1
    iget p1, p0, Lcom/android/launcher3/widget/U;->g:I

    .line 2
    .line 3
    iget v0, p0, Lcom/android/launcher3/widget/U;->i:I

    .line 4
    .line 5
    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iget v0, p2, Lcom/android/launcher3/F1;->H0:I

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-gt p1, v0, :cond_0

    .line 13
    .line 14
    iget p1, p0, Lcom/android/launcher3/widget/U;->h:I

    .line 15
    .line 16
    iget v0, p0, Lcom/android/launcher3/widget/U;->j:I

    .line 17
    .line 18
    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    iget v0, p2, Lcom/android/launcher3/F1;->G0:I

    .line 23
    .line 24
    if-gt p1, v0, :cond_0

    .line 25
    .line 26
    move p1, v1

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 p1, 0x0

    .line 29
    :goto_0
    iput-boolean p1, p0, Lcom/android/launcher3/widget/U;->m:Z

    .line 30
    .line 31
    iget p1, p0, Lcom/android/launcher3/widget/U;->i:I

    .line 32
    .line 33
    iget v0, p2, Lcom/android/launcher3/F1;->H0:I

    .line 34
    .line 35
    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    iput p1, p0, Lcom/android/launcher3/widget/U;->i:I

    .line 40
    .line 41
    invoke-static {p1, v1}, Ljava/lang/Math;->max(II)I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    iput p1, p0, Lcom/android/launcher3/widget/U;->i:I

    .line 46
    .line 47
    iget p1, p0, Lcom/android/launcher3/widget/U;->j:I

    .line 48
    .line 49
    iget v0, p2, Lcom/android/launcher3/F1;->G0:I

    .line 50
    .line 51
    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    iput p1, p0, Lcom/android/launcher3/widget/U;->j:I

    .line 56
    .line 57
    invoke-static {p1, v1}, Ljava/lang/Math;->max(II)I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    iput p1, p0, Lcom/android/launcher3/widget/U;->j:I

    .line 62
    .line 63
    iget p1, p0, Lcom/android/launcher3/widget/U;->g:I

    .line 64
    .line 65
    iget v0, p2, Lcom/android/launcher3/F1;->H0:I

    .line 66
    .line 67
    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    iput p1, p0, Lcom/android/launcher3/widget/U;->g:I

    .line 72
    .line 73
    iget v0, p0, Lcom/android/launcher3/widget/U;->i:I

    .line 74
    .line 75
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    iput p1, p0, Lcom/android/launcher3/widget/U;->g:I

    .line 80
    .line 81
    iget p1, p0, Lcom/android/launcher3/widget/U;->h:I

    .line 82
    .line 83
    iget p2, p2, Lcom/android/launcher3/F1;->G0:I

    .line 84
    .line 85
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    iput p1, p0, Lcom/android/launcher3/widget/U;->h:I

    .line 90
    .line 91
    iget p2, p0, Lcom/android/launcher3/widget/U;->j:I

    .line 92
    .line 93
    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    iput p1, p0, Lcom/android/launcher3/widget/U;->h:I

    .line 98
    .line 99
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/appwidget/AppWidgetProviderInfo;->writeToParcel(Landroid/os/Parcel;I)V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 5
    .line 6
    invoke-virtual {p2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object p2, p0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 14
    .line 15
    invoke-virtual {p2}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object p2, p0, Landroid/appwidget/AppWidgetProviderInfo;->label:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget p2, p0, Landroid/appwidget/AppWidgetProviderInfo;->initialLayout:I

    .line 28
    .line 29
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 30
    .line 31
    .line 32
    iget p2, p0, Landroid/appwidget/AppWidgetProviderInfo;->icon:I

    .line 33
    .line 34
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 35
    .line 36
    .line 37
    iget p2, p0, Landroid/appwidget/AppWidgetProviderInfo;->previewImage:I

    .line 38
    .line 39
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 40
    .line 41
    .line 42
    iget p2, p0, Landroid/appwidget/AppWidgetProviderInfo;->resizeMode:I

    .line 43
    .line 44
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 45
    .line 46
    .line 47
    iget p2, p0, Lcom/android/launcher3/widget/U;->g:I

    .line 48
    .line 49
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 50
    .line 51
    .line 52
    iget p2, p0, Lcom/android/launcher3/widget/U;->h:I

    .line 53
    .line 54
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 55
    .line 56
    .line 57
    iget p2, p0, Lcom/android/launcher3/widget/U;->i:I

    .line 58
    .line 59
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 60
    .line 61
    .line 62
    iget p0, p0, Lcom/android/launcher3/widget/U;->j:I

    .line 63
    .line 64
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    .line 65
    .line 66
    .line 67
    return-void
.end method
