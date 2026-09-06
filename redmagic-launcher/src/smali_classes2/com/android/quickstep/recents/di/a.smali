.class public final synthetic Lcom/android/quickstep/recents/di/a;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lu4/l;


# instance fields
.field public final synthetic g:Lu4/a;


# direct methods
.method public synthetic constructor <init>(Lu4/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/recents/di/a;->g:Lu4/a;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/di/a;->g:Lu4/a;

    .line 2
    .line 3
    check-cast p1, Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;

    .line 4
    .line 5
    invoke-static {p0, p1}, Lcom/android/quickstep/recents/di/RecentsDependencies;->a(Lu4/a;Lcom/android/quickstep/recents/di/RecentsDependenciesExtras;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
