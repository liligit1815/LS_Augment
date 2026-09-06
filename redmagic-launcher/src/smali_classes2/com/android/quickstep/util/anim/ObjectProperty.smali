.class public abstract Lcom/android/quickstep/util/anim/ObjectProperty;
.super Ljava/lang/Object;
.source "ObjectProperty.java"

# interfaces
.implements Lcom/android/quickstep/util/anim/BaseProperty;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/android/quickstep/util/anim/BaseProperty<",
        "Ljava/lang/Object;",
        "TV;>;"
    }
.end annotation


# instance fields
.field private value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TV;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/anim/ObjectProperty;->value:Ljava/lang/Object;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public afterChange(Lcom/android/quickstep/util/anim/ObjectAnnotationProperty;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/util/anim/ObjectAnnotationProperty<",
            "*>;TV;TV;)V"
        }
    .end annotation

    .line 1
    const-string p0, "property"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public beforeChange(Lcom/android/quickstep/util/anim/ObjectAnnotationProperty;Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/util/anim/ObjectAnnotationProperty<",
            "*>;TV;TV;)Z"
        }
    .end annotation

    .line 1
    const-string p0, "property"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0
.end method

.method public getValue(Ljava/lang/Object;Lcom/android/quickstep/util/anim/ObjectAnnotationProperty;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lcom/android/quickstep/util/anim/ObjectAnnotationProperty<",
            "*>;)TV;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/anim/ObjectProperty;->value:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public setValue(Ljava/lang/Object;Lcom/android/quickstep/util/anim/ObjectAnnotationProperty;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lcom/android/quickstep/util/anim/ObjectAnnotationProperty<",
            "*>;TV;)V"
        }
    .end annotation

    .line 1
    const-string p1, "property"

    .line 2
    .line 3
    invoke-static {p2, p1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/quickstep/util/anim/ObjectProperty;->value:Ljava/lang/Object;

    .line 7
    .line 8
    invoke-virtual {p0, p2, p1, p3}, Lcom/android/quickstep/util/anim/ObjectProperty;->beforeChange(Lcom/android/quickstep/util/anim/ObjectAnnotationProperty;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iput-object p3, p0, Lcom/android/quickstep/util/anim/ObjectProperty;->value:Ljava/lang/Object;

    .line 15
    .line 16
    invoke-virtual {p0, p2, p1, p3}, Lcom/android/quickstep/util/anim/ObjectProperty;->afterChange(Lcom/android/quickstep/util/anim/ObjectAnnotationProperty;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "ObservableProperty(value="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/quickstep/util/anim/ObjectProperty;->value:Ljava/lang/Object;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const/16 p0, 0x29

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method
