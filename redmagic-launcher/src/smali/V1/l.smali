.class public final synthetic LV1/l;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements LM2/i$g;


# instance fields
.field public final synthetic a:LV1/y$e;

.field public final synthetic b:LV1/y;


# direct methods
.method public synthetic constructor <init>(LV1/y$e;LV1/y;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LV1/l;->a:LV1/y$e;

    .line 5
    .line 6
    iput-object p2, p0, LV1/l;->b:LV1/y;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Landroid/util/ArrayMap;)V
    .locals 1

    .line 1
    iget-object v0, p0, LV1/l;->a:LV1/y$e;

    .line 2
    .line 3
    iget-object p0, p0, LV1/l;->b:LV1/y;

    .line 4
    .line 5
    check-cast p1, Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;

    .line 6
    .line 7
    invoke-static {v0, p0, p1, p2}, LV1/y;->s(LV1/y$e;LV1/y;Lcom/android/launcher3/taskbar/bubbles/BubbleBarView;Landroid/util/ArrayMap;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
