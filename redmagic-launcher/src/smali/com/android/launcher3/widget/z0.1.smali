.class public Lcom/android/launcher3/widget/z0;
.super Lcom/android/launcher3/W4;
.source "PendingAddWidgetInfo.java"


# instance fields
.field public l:I

.field public m:I

.field public n:Lcom/android/launcher3/widget/U;

.field public o:Landroid/appwidget/AppWidgetHostView;

.field public p:Landroid/os/Bundle;

.field public q:I

.field public r:Lcom/android/launcher3/widget/picker/d;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/widget/U;I)V
    .locals 1

    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/W4;-><init>()V

    const/4 v0, 0x0

    .line 4
    iput-object v0, p0, Lcom/android/launcher3/widget/z0;->p:Landroid/os/Bundle;

    .line 5
    iput-object v0, p0, Lcom/android/launcher3/widget/z0;->r:Lcom/android/launcher3/widget/picker/d;

    .line 6
    invoke-virtual {p1}, Lcom/android/launcher3/widget/U;->B()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x5

    .line 7
    iput v0, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    goto :goto_0

    :cond_0
    const/4 v0, 0x4

    .line 8
    iput v0, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 9
    :goto_0
    iput-object p1, p0, Lcom/android/launcher3/widget/z0;->n:Lcom/android/launcher3/widget/U;

    .line 10
    invoke-virtual {p1}, Landroid/appwidget/AppWidgetProviderInfo;->getProfile()Landroid/os/UserHandle;

    move-result-object v0

    iput-object v0, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 11
    iget-object v0, p1, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    iput-object v0, p0, Lcom/android/launcher3/W4;->k:Landroid/content/ComponentName;

    .line 12
    iget v0, p1, Landroid/appwidget/AppWidgetProviderInfo;->previewImage:I

    iput v0, p0, Lcom/android/launcher3/widget/z0;->l:I

    .line 13
    iget v0, p1, Landroid/appwidget/AppWidgetProviderInfo;->icon:I

    iput v0, p0, Lcom/android/launcher3/widget/z0;->m:I

    .line 14
    iget v0, p1, Lcom/android/launcher3/widget/U;->g:I

    iput v0, p0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 15
    iget v0, p1, Lcom/android/launcher3/widget/U;->h:I

    iput v0, p0, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 16
    iget v0, p1, Lcom/android/launcher3/widget/U;->i:I

    iput v0, p0, Lcom/android/launcher3/model/data/y;->minSpanX:I

    .line 17
    iget p1, p1, Lcom/android/launcher3/widget/U;->j:I

    iput p1, p0, Lcom/android/launcher3/model/data/y;->minSpanY:I

    .line 18
    iput p2, p0, Lcom/android/launcher3/model/data/y;->container:I

    iput p2, p0, Lcom/android/launcher3/widget/z0;->q:I

    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/widget/U;ILcom/android/launcher3/widget/picker/d;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/widget/z0;-><init>(Lcom/android/launcher3/widget/U;I)V

    .line 2
    iput-object p3, p0, Lcom/android/launcher3/widget/z0;->r:Lcom/android/launcher3/widget/picker/d;

    return-void
.end method


# virtual methods
.method public P(Landroid/content/Context;)Landroid/os/Bundle;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/W4;->k:Landroid/content/ComponentName;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 4
    .line 5
    iget p0, p0, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 6
    .line 7
    invoke-static {p1, v0, v1, p0}, Lr2/b;->d(Landroid/content/Context;Landroid/content/ComponentName;II)Landroid/os/Bundle;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public Q()Lcom/android/launcher3/widget/N0;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/widget/N0;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/widget/z0;->n:Lcom/android/launcher3/widget/U;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Lcom/android/launcher3/widget/N0;-><init>(Landroid/appwidget/AppWidgetProviderInfo;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public buildProto(Lcom/android/launcher3/model/data/m;Landroid/content/Context;)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;
    .locals 0

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
    move-result-object p1

    .line 9
    check-cast p1, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;

    .line 10
    .line 11
    iget p0, p0, Lcom/android/launcher3/widget/z0;->q:I

    .line 12
    .line 13
    invoke-static {p0}, Lcom/android/launcher3/model/data/A;->w(I)Lcom/android/launcher3/logger/LauncherAtom$Attribute;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p1, p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;->addItemAttributes(Lcom/android/launcher3/logger/LauncherAtom$Attribute;)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;

    .line 26
    .line 27
    return-object p0
.end method
