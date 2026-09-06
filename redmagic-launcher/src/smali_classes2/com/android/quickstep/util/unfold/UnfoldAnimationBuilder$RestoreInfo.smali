.class public final Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;
.super Ljava/lang/Object;
.source "UnfoldAnimationBuilder.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "RestoreInfo"
.end annotation


# instance fields
.field private final action:Lu4/p;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/p<",
            "Landroid/view/ViewGroup;",
            "Ljava/lang/Boolean;",
            "Lh4/t;",
            ">;"
        }
    .end annotation
.end field

.field private target:Landroid/view/ViewGroup;

.field private value:Z


# direct methods
.method public constructor <init>(Lu4/p;Landroid/view/ViewGroup;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lu4/p<",
            "-",
            "Landroid/view/ViewGroup;",
            "-",
            "Ljava/lang/Boolean;",
            "Lh4/t;",
            ">;",
            "Landroid/view/ViewGroup;",
            "Z)V"
        }
    .end annotation

    .line 1
    const-string v0, "action"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "target"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;->action:Lu4/p;

    .line 15
    .line 16
    iput-object p2, p0, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;->target:Landroid/view/ViewGroup;

    .line 17
    .line 18
    iput-boolean p3, p0, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;->value:Z

    .line 19
    .line 20
    return-void
.end method

.method public static synthetic copy$default(Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;Lu4/p;Landroid/view/ViewGroup;ZILjava/lang/Object;)Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;
    .locals 0

    .line 1
    and-int/lit8 p5, p4, 0x1

    .line 2
    .line 3
    if-eqz p5, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;->action:Lu4/p;

    .line 6
    .line 7
    :cond_0
    and-int/lit8 p5, p4, 0x2

    .line 8
    .line 9
    if-eqz p5, :cond_1

    .line 10
    .line 11
    iget-object p2, p0, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;->target:Landroid/view/ViewGroup;

    .line 12
    .line 13
    :cond_1
    and-int/lit8 p4, p4, 0x4

    .line 14
    .line 15
    if-eqz p4, :cond_2

    .line 16
    .line 17
    iget-boolean p3, p0, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;->value:Z

    .line 18
    .line 19
    :cond_2
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;->copy(Lu4/p;Landroid/view/ViewGroup;Z)Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method


# virtual methods
.method public final component1()Lu4/p;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lu4/p<",
            "Landroid/view/ViewGroup;",
            "Ljava/lang/Boolean;",
            "Lh4/t;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;->action:Lu4/p;

    .line 2
    .line 3
    return-object p0
.end method

.method public final component2()Landroid/view/ViewGroup;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;->target:Landroid/view/ViewGroup;

    .line 2
    .line 3
    return-object p0
.end method

.method public final component3()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;->value:Z

    .line 2
    .line 3
    return p0
.end method

.method public final copy(Lu4/p;Landroid/view/ViewGroup;Z)Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lu4/p<",
            "-",
            "Landroid/view/ViewGroup;",
            "-",
            "Ljava/lang/Boolean;",
            "Lh4/t;",
            ">;",
            "Landroid/view/ViewGroup;",
            "Z)",
            "Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;"
        }
    .end annotation

    .line 1
    const-string p0, "action"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "target"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance p0, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;

    .line 12
    .line 13
    invoke-direct {p0, p1, p2, p3}, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;-><init>(Lu4/p;Landroid/view/ViewGroup;Z)V

    .line 14
    .line 15
    .line 16
    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;->action:Lu4/p;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;->action:Lu4/p;

    .line 16
    .line 17
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_2

    .line 22
    .line 23
    return v2

    .line 24
    :cond_2
    iget-object v1, p0, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;->target:Landroid/view/ViewGroup;

    .line 25
    .line 26
    iget-object v3, p1, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;->target:Landroid/view/ViewGroup;

    .line 27
    .line 28
    invoke-static {v1, v3}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-nez v1, :cond_3

    .line 33
    .line 34
    return v2

    .line 35
    :cond_3
    iget-boolean p0, p0, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;->value:Z

    .line 36
    .line 37
    iget-boolean p1, p1, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;->value:Z

    .line 38
    .line 39
    if-eq p0, p1, :cond_4

    .line 40
    .line 41
    return v2

    .line 42
    :cond_4
    return v0
.end method

.method public final getAction()Lu4/p;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lu4/p<",
            "Landroid/view/ViewGroup;",
            "Ljava/lang/Boolean;",
            "Lh4/t;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;->action:Lu4/p;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getTarget()Landroid/view/ViewGroup;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;->target:Landroid/view/ViewGroup;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getValue()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;->value:Z

    .line 2
    .line 3
    return p0
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;->action:Lu4/p;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    mul-int/lit8 v0, v0, 0x1f

    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;->target:Landroid/view/ViewGroup;

    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/view/ViewGroup;->hashCode()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    add-int/2addr v0, v1

    .line 16
    mul-int/lit8 v0, v0, 0x1f

    .line 17
    .line 18
    iget-boolean p0, p0, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;->value:Z

    .line 19
    .line 20
    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    add-int/2addr v0, p0

    .line 25
    return v0
.end method

.method public final setTarget(Landroid/view/ViewGroup;)V
    .locals 1

    .line 1
    const-string v0, "<set-?>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;->target:Landroid/view/ViewGroup;

    .line 7
    .line 8
    return-void
.end method

.method public final setValue(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;->value:Z

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;->action:Lu4/p;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;->target:Landroid/view/ViewGroup;

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/android/quickstep/util/unfold/UnfoldAnimationBuilder$RestoreInfo;->value:Z

    .line 6
    .line 7
    new-instance v2, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v3, "RestoreInfo(action="

    .line 13
    .line 14
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v0, ", target="

    .line 21
    .line 22
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v0, ", value="

    .line 29
    .line 30
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string p0, ")"

    .line 37
    .line 38
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method
