.class Lcom/android/quickstep/util/animation/DynamicAnimation$15;
.super Landroid/util/FloatProperty;
.source "DynamicAnimation.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/util/animation/DynamicAnimation;-><init>(Lcom/android/quickstep/util/animation/FloatValueHolder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$floatValueHolder:Lcom/android/quickstep/util/animation/FloatValueHolder;


# direct methods
.method constructor <init>(Lcom/android/quickstep/util/animation/DynamicAnimation;Ljava/lang/String;Lcom/android/quickstep/util/animation/FloatValueHolder;)V
    .locals 0

    .line 1
    iput-object p3, p0, Lcom/android/quickstep/util/animation/DynamicAnimation$15;->val$floatValueHolder:Lcom/android/quickstep/util/animation/FloatValueHolder;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/util/FloatProperty;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public get(Ljava/lang/Object;)Ljava/lang/Float;
    .locals 0

    .line 2
    iget-object p0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation$15;->val$floatValueHolder:Lcom/android/quickstep/util/animation/FloatValueHolder;

    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/FloatValueHolder;->getValue()F

    move-result p0

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/animation/DynamicAnimation$15;->get(Ljava/lang/Object;)Ljava/lang/Float;

    move-result-object p0

    return-object p0
.end method

.method public setValue(Ljava/lang/Object;F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/animation/DynamicAnimation$15;->val$floatValueHolder:Lcom/android/quickstep/util/animation/FloatValueHolder;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Lcom/android/quickstep/util/animation/FloatValueHolder;->setValue(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
