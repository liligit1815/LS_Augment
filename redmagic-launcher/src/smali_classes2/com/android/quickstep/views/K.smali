.class public final synthetic Lcom/android/quickstep/views/K;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lu4/l;


# instance fields
.field public final synthetic g:Landroidx/dynamicanimation/animation/j;

.field public final synthetic h:Lcom/android/quickstep/views/RecentsDismissUtils;


# direct methods
.method public synthetic constructor <init>(Landroidx/dynamicanimation/animation/j;Lcom/android/quickstep/views/RecentsDismissUtils;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/views/K;->g:Landroidx/dynamicanimation/animation/j;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/views/K;->h:Lcom/android/quickstep/views/RecentsDismissUtils;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/K;->g:Landroidx/dynamicanimation/animation/j;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/views/K;->h:Lcom/android/quickstep/views/RecentsDismissUtils;

    .line 4
    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-static {v0, p0, p1}, Lcom/android/quickstep/views/RecentsDismissUtils;->n(Landroidx/dynamicanimation/animation/j;Lcom/android/quickstep/views/RecentsDismissUtils;F)Lh4/t;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method
