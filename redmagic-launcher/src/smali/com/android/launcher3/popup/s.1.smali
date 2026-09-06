.class public final synthetic Lcom/android/launcher3/popup/s;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/shortcuts/DeepShortcutView;

.field public final synthetic h:Lcom/android/launcher3/model/data/I;

.field public final synthetic i:Landroid/content/pm/ShortcutInfo;

.field public final synthetic j:Lcom/android/launcher3/popup/PopupContainerWithArrow;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/shortcuts/DeepShortcutView;Lcom/android/launcher3/model/data/I;Landroid/content/pm/ShortcutInfo;Lcom/android/launcher3/popup/PopupContainerWithArrow;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/popup/s;->g:Lcom/android/launcher3/shortcuts/DeepShortcutView;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/popup/s;->h:Lcom/android/launcher3/model/data/I;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/popup/s;->i:Landroid/content/pm/ShortcutInfo;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/launcher3/popup/s;->j:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/popup/s;->g:Lcom/android/launcher3/shortcuts/DeepShortcutView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/popup/s;->h:Lcom/android/launcher3/model/data/I;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/launcher3/popup/s;->i:Landroid/content/pm/ShortcutInfo;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/popup/s;->j:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p0}, Lcom/android/launcher3/popup/t;->d(Lcom/android/launcher3/shortcuts/DeepShortcutView;Lcom/android/launcher3/model/data/I;Landroid/content/pm/ShortcutInfo;Lcom/android/launcher3/popup/PopupContainerWithArrow;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
