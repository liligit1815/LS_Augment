.class public final synthetic Lcom/android/launcher3/util/n3;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:LW/d;

.field public final synthetic h:Lcom/android/launcher3/util/o3;


# direct methods
.method public synthetic constructor <init>(LW/d;Lcom/android/launcher3/util/o3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/util/n3;->g:LW/d;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/util/n3;->h:Lcom/android/launcher3/util/o3;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/n3;->g:LW/d;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/util/n3;->h:Lcom/android/launcher3/util/o3;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/android/launcher3/util/o3;->a(LW/d;Lcom/android/launcher3/util/o3;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
