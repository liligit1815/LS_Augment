.class public final synthetic Lcom/android/quickstep/p2;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Predicate;


# instance fields
.field public final synthetic a:Lcom/android/quickstep/RecentTasksList;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/RecentTasksList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/p2;->a:Lcom/android/quickstep/RecentTasksList;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/p2;->a:Lcom/android/quickstep/RecentTasksList;

    .line 2
    .line 3
    check-cast p1, Lcom/android/wm/shell/shared/i;

    .line 4
    .line 5
    invoke-static {p0, p1}, Lcom/android/quickstep/RecentTasksList;->h(Lcom/android/quickstep/RecentTasksList;Lcom/android/wm/shell/shared/i;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
