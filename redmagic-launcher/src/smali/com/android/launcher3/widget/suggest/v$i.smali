.class Lcom/android/launcher3/widget/suggest/v$i;
.super Lcom/android/launcher3/popup/P;
.source "SuggestWidgetUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/widget/suggest/v;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "i"
.end annotation


# direct methods
.method public constructor <init>(Lcom/android/launcher3/v;Lcom/android/launcher3/model/data/y;Landroid/view/View;)V
    .locals 8

    .line 1
    const-string v3, "shortcut_common_bg"

    .line 2
    .line 3
    const v4, 0x7f140410

    .line 4
    .line 5
    .line 6
    const v1, 0x7f0818b9

    .line 7
    .line 8
    .line 9
    const-string v2, "pin_off"

    .line 10
    .line 11
    move-object v0, p0

    .line 12
    move-object v5, p1

    .line 13
    move-object v6, p2

    .line 14
    move-object v7, p3

    .line 15
    invoke-direct/range {v0 .. v7}, Lcom/android/launcher3/popup/P;-><init>(ILjava/lang/String;Ljava/lang/String;ILcom/android/launcher3/views/k;Lcom/android/launcher3/model/data/y;Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "Unlock SystemShortcut onClick, getTargetComponent="

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v0, 0x0

    .line 21
    :goto_0
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const-string v0, "SuggestWidgetUtils"

    .line 29
    .line 30
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/android/launcher3/popup/P;->mTarget:Lcom/android/launcher3/views/k;

    .line 34
    .line 35
    check-cast p1, Lcom/android/launcher3/C2;

    .line 36
    .line 37
    const/4 v0, 0x1

    .line 38
    const/4 v1, 0x2

    .line 39
    invoke-static {p1, v0, v1}, Lcom/android/launcher3/a;->closeOpenViews(Lcom/android/launcher3/views/k;ZI)V

    .line 40
    .line 41
    .line 42
    const-string v0, "unlock_app"

    .line 43
    .line 44
    iget-object p0, p0, Lcom/android/launcher3/popup/P;->mOriginalView:Landroid/view/View;

    .line 45
    .line 46
    invoke-static {p1, v0, p0}, Lcom/android/launcher3/widget/suggest/v;->j(Lcom/android/launcher3/C2;Ljava/lang/String;Landroid/view/View;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method
