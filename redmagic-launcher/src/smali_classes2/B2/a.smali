.class public final synthetic LB2/a;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lu4/a;


# instance fields
.field public final synthetic g:Lcom/android/systemui/shared/shadow/DoubleShadowTextClock;

.field public final synthetic h:Landroid/graphics/Canvas;


# direct methods
.method public synthetic constructor <init>(Lcom/android/systemui/shared/shadow/DoubleShadowTextClock;Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LB2/a;->g:Lcom/android/systemui/shared/shadow/DoubleShadowTextClock;

    .line 5
    .line 6
    iput-object p2, p0, LB2/a;->h:Landroid/graphics/Canvas;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, LB2/a;->g:Lcom/android/systemui/shared/shadow/DoubleShadowTextClock;

    .line 2
    .line 3
    iget-object p0, p0, LB2/a;->h:Landroid/graphics/Canvas;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/android/systemui/shared/shadow/DoubleShadowTextClock;->a(Lcom/android/systemui/shared/shadow/DoubleShadowTextClock;Landroid/graphics/Canvas;)Lh4/t;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
