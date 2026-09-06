.class final synthetic Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$CLIP_CHILDREN$1;
.super Lkotlin/jvm/internal/m;
.source "UnfoldAnimationBuilder.kt"

# interfaces
.implements Lu4/p;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1000
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/m;",
        "Lu4/p<",
        "Landroid/view/ViewGroup;",
        "Ljava/lang/Boolean;",
        "Lh4/t;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$CLIP_CHILDREN$1;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$CLIP_CHILDREN$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$CLIP_CHILDREN$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$CLIP_CHILDREN$1;->INSTANCE:Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$CLIP_CHILDREN$1;

    .line 7
    .line 8
    return-void
.end method

.method constructor <init>()V
    .locals 6

    .line 1
    const-string v4, "setClipChildren(Z)V"

    .line 2
    .line 3
    const/4 v5, 0x0

    .line 4
    const/4 v1, 0x2

    .line 5
    const-class v2, Landroid/view/ViewGroup;

    .line 6
    .line 7
    const-string v3, "setClipChildren"

    .line 8
    .line 9
    move-object v0, p0

    .line 10
    invoke-direct/range {v0 .. v5}, Lkotlin/jvm/internal/m;-><init>(ILjava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Landroid/view/ViewGroup;

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$CLIP_CHILDREN$1;->invoke(Landroid/view/ViewGroup;Z)V

    sget-object p0, Lh4/t;->a:Lh4/t;

    return-object p0
.end method

.method public final invoke(Landroid/view/ViewGroup;Z)V
    .locals 0

    const-string p0, "p0"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    return-void
.end method
