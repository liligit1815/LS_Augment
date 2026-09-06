.class public final synthetic Lcom/android/launcher3/widget/group/a;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/Comparator;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Landroid/content/pm/ShortcutInfo;

    .line 2
    .line 3
    check-cast p2, Landroid/content/pm/ShortcutInfo;

    .line 4
    .line 5
    invoke-static {p1, p2}, Lcom/android/launcher3/widget/group/b;->a0(Landroid/content/pm/ShortcutInfo;Landroid/content/pm/ShortcutInfo;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
